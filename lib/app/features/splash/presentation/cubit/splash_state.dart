import 'package:chaty_app/app/core/domain/entities/user_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  factory SplashState.initial() = InitialState;
  factory SplashState.loading() = LoadingState;
  factory SplashState.loaded({UserAccount? user}) = LoadedState;
  factory SplashState.error({required String message}) = ErrorState;
}
