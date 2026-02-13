import 'dart:async';

import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/delete_conversation_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/logout_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_user_conversations_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxCubit extends Cubit<InboxState> {
  final LogoutUsecase _logoutUsecase;
  final GetUserLoggedUsecase _getUserLoggedUsecase;
  final WatchUserConversationsUsecase _watchUserConversationsUsecase;
  final DeleteConversationUsecase _deleteConversationUsecase;

  StreamSubscription<List<UserConversation>>? _subscription;

  InboxCubit({
    required LogoutUsecase logoutUsecase,
    required WatchUserConversationsUsecase watchUserConversationsUsecase,
    required GetUserLoggedUsecase getUserLoggedUsecase,
    required DeleteConversationUsecase deleteConversationUsecase,
  }) : _logoutUsecase = logoutUsecase,
       _watchUserConversationsUsecase = watchUserConversationsUsecase,
       _getUserLoggedUsecase = getUserLoggedUsecase,
       _deleteConversationUsecase = deleteConversationUsecase,
       super(InboxState.initial());

  Future<void> subscribe() async {
    try {
      emit(InboxState.loading());

      await _subscription?.cancel();
      final userLogged = await _getUserLoggedUsecase.call();
      _subscription = _watchUserConversationsUsecase(userId: userLogged!.id!)
          .listen(
            (conversations) {
              emit(InboxState.loaded(conversations: conversations));
            },
            onError: (error) {
              emit(InboxState.erro(message: 'Erro ao carregar conversas'));
            },
          );
    } catch (e) {
      emit(
        InboxState.erro(
          message: 'Ocorreu um erro inesperado ao carregar conversas',
        ),
      );
    }
  }

  Future<void> deleteConversation({required String conversationId}) async {
    try {
      emit(InboxState.loading());
      final userLogged = await _getUserLoggedUsecase.call();
      await _deleteConversationUsecase.call(
        myUid: userLogged!.id!,
        conversationId: conversationId,
      );
      emit(InboxState.deleteMessaging());
    } on AppException catch (e) {
      emit(InboxState.erro(message: e.message));
    }catch(e){
       emit(
        InboxState.erro(
          message: "Ocorreu um erro inesperado ao deletar a mensagem",
        ),
      );
    }
  }

  Future<void> logout() async {
    try {
      emit(InboxState.loading());
      await _logoutUsecase.call();
      emit(InboxState.loaded(conversations: []));
    } on AppException catch (e) {
      emit(InboxState.erro(message: e.message));
    } catch (e) {
      emit(
        InboxState.erro(
          message: "Ocorreu um erro inesperado ao realizar o logout",
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
