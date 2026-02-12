import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_state.freezed.dart';

@freezed
abstract class ConversationState with _$ConversationState {
   factory ConversationState.initial() = _InitialState;
   factory ConversationState.loading() = _LoadingState;
   factory ConversationState.loaded() = _LoadedState;
   factory ConversationState.erro({required String message}) = _ErrorState;
}