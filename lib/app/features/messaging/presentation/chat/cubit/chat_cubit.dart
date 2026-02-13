import 'dart:async';

import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/delete_conversation_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/send_message_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_messages_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final WatchMessagesUsecase _watchMessagesUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final DeleteConversationUsecase _deleteConversationsUsecase;
  final GetUserLoggedUsecase _getUserLoggedUsecase;

  StreamSubscription<List<Message>>? _sub;

  ChatCubit({
    required WatchMessagesUsecase watchMessagesUsecase,
    required SendMessageUsecase sendMessageUsecase,
    required DeleteConversationUsecase deleteConversationUsecase,
    required GetUserLoggedUsecase getUserLogged,
  }) : _watchMessagesUsecase = watchMessagesUsecase,
       _sendMessageUsecase = sendMessageUsecase,
       _deleteConversationsUsecase = deleteConversationUsecase,
       _getUserLoggedUsecase = getUserLogged,
       super(ChatState.initial());

  int _countMessages = 0;

  Future<void> subscribe({
    required String conversationId,
    required String myUid,
    int limit = 50,
  }) async {
    try {
      emit(ChatState.loading());

      await _sub?.cancel();
      _sub =
          _watchMessagesUsecase(
            conversationId: conversationId,
            limit: limit,
            myUid: myUid,
          ).listen(
            (messages) {
              emit(
                ChatState.loaded(
                  conversationId: conversationId,
                  messages: messages,
                ),
              );
            },
            onError: (error) {
              final msg = error is AppException
                  ? error.message
                  : 'Erro ao carregar mensagens';
              emit(ChatState.error(message: msg));
            },
          );
    } catch (e) {
      emit(
        ChatState.error(
          message: 'Ocorreu um erro inesperado ao carregar mensagens',
        ),
      );
    }
  }

  //Quando eu clico em um contato, ele cria um doc de mensagem no firebase com a ultima mensagem sendo ""
  //Essa função verifica se o chat teve alguma mensagem de fato e deleta se for 0, pra nao ficar aparecendo um chat vazio no inbox
  Future<void> deleteTempMessage({required String conversationId}) async {
    if (_countMessages == 0) {
      final userLogged = await _getUserLoggedUsecase.call();
      await _deleteConversationsUsecase.call(
        myUid: userLogged!.id!,
        conversationId: conversationId,
      );
    }
  }

  Future<void> send({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
    String? myName,
    String? otherName,
  }) async {
    try {
      final trimmed = text.trim();
      if (trimmed.isEmpty) return;

      await _sendMessageUsecase(
        conversationId: conversationId,
        myUid: myUid,
        otherUid: otherUid,
        text: trimmed,
      );
      _countMessages += 1;
    } on AppException catch (e) {
      emit(ChatState.error(message: e.message));
    } catch (e) {
      emit(
        ChatState.error(
          message: 'Ocorreu um erro inesperado ao enviar mensagem',
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _countMessages += 0;
    await _sub?.cancel();
    return super.close();
  }
}
