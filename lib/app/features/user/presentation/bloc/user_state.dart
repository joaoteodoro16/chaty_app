import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
   factory UserState.initial() = _InitialState;
   factory UserState.loading() = _LoadingState;
   factory UserState.loadedUser({required UserAccount user}) = _LoadedUserState;
   factory UserState.save({required String message}) = _SaveState;
   factory UserState.error({required String message}) = _ErroState;
}