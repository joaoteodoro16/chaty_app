import 'dart:async';

import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/logout_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_user_conversations_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxCubit extends Cubit<InboxState> {
  final LogoutUsecase _logoutUsecase;
  final WatchUserConversationsUsecase _watchUserConversationsUsecase;

  StreamSubscription<List<UserConversation>>? _subscription;

  InboxCubit({
    required LogoutUsecase logoutUsecase,
    required WatchUserConversationsUsecase watchUserConversationsUsecase,
  })  : _logoutUsecase = logoutUsecase,
        _watchUserConversationsUsecase = watchUserConversationsUsecase,
        super(InboxState.initial());

  /// 🔥 Escuta inbox em tempo real
  Future<void> subscribe({required String userId}) async {
    try {
      emit(InboxState.loading());

      await _subscription?.cancel();

      _subscription = _watchUserConversationsUsecase(
        userId: userId,
      ).listen(
        (conversations) {
          emit(InboxState.loaded(conversations: conversations));
        },
        onError: (error) {
          emit(
            InboxState.erro(
              message: 'Erro ao carregar conversas',
            ),
          );
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
