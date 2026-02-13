import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

@freezed
abstract class ContactState with _$ContactState {
  factory ContactState.initial() = _InitialState;
  factory ContactState.loading() = _LoadingState;
  factory ContactState.loaded({required List<Contact> contacts}) = _LoadedState;
  factory ContactState.error({required String message}) = _ErrorState;
  factory ContactState.deletedContact() = _DeletedContactState;

  factory ContactState.openChat({
    required String conversationId,
    required String otherUserId,
    required String otherUserName,
  }) = _OpenChatState;
}

