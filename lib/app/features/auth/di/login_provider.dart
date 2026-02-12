import 'package:chaty_app/app/features/auth/domain/usecases/contracts/login_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/impl/login_usecase_impl.dart';
import 'package:chaty_app/app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:chaty_app/app/features/auth/presentation/login/page/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginProvider {
  LoginProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<LoginUsecase>(
        create: (context) => LoginUsecaseImpl(authRepository: context.read()),
      ),
      BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(loginUsecase: context.read()),
      ),
    ],
    child: LoginPage(),
  );
}
