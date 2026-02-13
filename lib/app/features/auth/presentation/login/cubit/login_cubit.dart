import 'package:bloc/bloc.dart';
import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/login_usecase.dart';
import 'package:chaty_app/app/features/auth/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;

  LoginCubit({required LoginUsecase loginUsecase})
    : _loginUsecase = loginUsecase,
      super(LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginState.loading());
      final user =await _loginUsecase.call(email: email, password: password);
      emit(LoginState.loaded(user: user));
    } on AppException catch (e) {
      emit(LoginState.error(message: e.message));
    } catch (e) {
      emit(
        LoginState.error(
          message: "Ocorreu um erro inesperado ao realizar o login",
        ),
      );
    }
  }
}
