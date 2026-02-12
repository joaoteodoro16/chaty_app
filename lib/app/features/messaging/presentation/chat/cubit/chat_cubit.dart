import 'dart:async';

import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/send_message_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_messages_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final WatchMessagesUsecase _watchMessagesUsecase;
  final SendMessageUsecase _sendMessageUsecase;

  StreamSubscription<List<Message>>? _sub;

  ChatCubit({
    required WatchMessagesUsecase watchMessagesUsecase,
    required SendMessageUsecase sendMessageUsecase,
  })  : _watchMessagesUsecase = watchMessagesUsecase,
        _sendMessageUsecase = sendMessageUsecase,
        super(ChatState.initial());

  Future<void> subscribe({
    required String conversationId,
    int limit = 50,
  }) async {
    try {
      emit(ChatState.loading());

      await _sub?.cancel();
      _sub = _watchMessagesUsecase(
        conversationId: conversationId,
        limit: limit,
      ).listen(
        (messages) {
          emit(ChatState.loaded(conversationId: conversationId, messages: messages));
        },
        onError: (error) {
          final msg = error is AppException
              ? error.message
              : 'Erro ao carregar mensagens';
          emit(ChatState.error(message: msg));
        },
      );
    } catch (e) {
      emit(ChatState.error(message: 'Ocorreu um erro inesperado ao carregar mensagens'));
    }
  }

  Future<void> send({
    required String conversationId,
    required String myUid,
    required String otherUid,
    required String text,
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
    } on AppException catch (e) {
      emit(ChatState.error(message: e.message));
    } catch (e) {
      emit(ChatState.error(message: 'Ocorreu um erro inesperado ao enviar mensagem'));
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }
}
