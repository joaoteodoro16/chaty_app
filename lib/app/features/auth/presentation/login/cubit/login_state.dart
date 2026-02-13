import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
   factory LoginState.initial() = _LoginState;
   factory LoginState.loading() = _LoadingState;
   factory LoginState.loaded({required UserAccount user}) = _LoadedState;
   factory LoginState.error({required String message}) = _ErrorState;
}