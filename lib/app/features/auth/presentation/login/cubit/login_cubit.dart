import 'package:bloc/bloc.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/login_usecase.dart';
import 'package:chaty_app/app/features/auth/presentation/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase _loginUsecase;

  LoginCubit({required LoginUsecase loginUsecase}) : _loginUsecase = loginUsecase, super(LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginState.loading());
    await Future.delayed(Duration(seconds: 2));
    emit(LoginState.loaded());
  }
}
