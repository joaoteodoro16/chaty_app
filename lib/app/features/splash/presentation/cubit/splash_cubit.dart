import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/splash/presentation/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetUserLoggedUsecase _getUserLoggedUsecase;

  SplashCubit({required GetUserLoggedUsecase getUserLoggedUsecase})
    : _getUserLoggedUsecase = getUserLoggedUsecase,
      super(SplashState.initial());

  Future<void> getUserLogged() async {
    try {
      emit(SplashState.loading());
      final user = await _getUserLoggedUsecase.call();
      emit(SplashState.loaded(user: user));
    } on AppException catch (e) {
      emit(SplashState.error(message: e.message));
    } catch (e) {
      emit(
        SplashState.error(
          message:
              "Ocorreu um erro inesperado ao recuperar sua sessão. Por favor, faça login novamente",
        ),
      );
    }
  }
}
