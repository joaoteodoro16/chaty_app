import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState with _$SignupState {
   factory SignupState.initial() = _InitialState;
   factory SignupState.loading() = _LoadingState;
   factory SignupState.loaded() = _LoadedState;
   factory SignupState.error({required String message}) = _ErrorState;
}

