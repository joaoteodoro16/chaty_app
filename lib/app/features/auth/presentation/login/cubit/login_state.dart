import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
   factory LoginState.initial() = _LoginState;
   factory LoginState.loading() = _LoadingState;
   factory LoginState.loaded() = _LoadedState;
   factory LoginState.error({required String message}) = _ErrorState;
}