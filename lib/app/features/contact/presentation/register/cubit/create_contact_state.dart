
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_contact_state.freezed.dart';

@freezed
abstract class CreateContactState with _$CreateContactState {
   factory CreateContactState.initial() = _InitialState;
   factory CreateContactState.loading() = _LoadingState;
   factory CreateContactState.save() = _SaveState;
   factory CreateContactState.error({required String message}) = _ErrorState;
}