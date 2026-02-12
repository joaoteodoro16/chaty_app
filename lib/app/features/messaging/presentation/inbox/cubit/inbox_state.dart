import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_state.freezed.dart';

@freezed
abstract class InboxState with _$InboxState {
  factory InboxState.initial() = _InitialState;
  factory InboxState.loading() = _LoadingState;

  factory InboxState.loaded({required List<UserConversation> conversations}) =
      _LoadedState;

  factory InboxState.erro({required String message}) = _ErrorState;
}
