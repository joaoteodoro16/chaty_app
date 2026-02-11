import 'package:chaty_app/app/core/exceptions/exeptions.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/signup_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/params/signup_params.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUsecase _signupUsecase;

  SignupCubit({required SignupUsecase signupUsecase})
    : _signupUsecase = signupUsecase,
      super(SignupState.initial());

  Future<void> signup({required SignupParams params}) async {
    emit(SignupState.loading());
    try {
      await _signupUsecase.call(params: params);
      emit(SignupState.loaded());
    } on AppException catch (e) {
      emit(SignupState.error(message: e.message));
    }catch(e){
      emit(SignupState.error(message: "Ocorreu um erro inesperado ao criar a conta"));
    }
  }
}
