import 'package:chaty_app/app/features/messaging/domain/entities/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  factory ChatState.initial() = _InitialState;
  factory ChatState.loading() = _LoadingState;

  factory ChatState.loaded({
    required String conversationId,
    required List<Message> messages,
  }) = _LoadedState;

  factory ChatState.error({required String message}) = _ErrorState;
}
