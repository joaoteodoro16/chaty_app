import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/impl/auth_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
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
      Provider<AuthRemoteDatasource>(
        create: (context) => AuthRemoteDatasourceImpl(),
      ),
      Provider<AuthRepository>(
        create: (context) => AuthRepositoryImpl(remote: context.read()),
      ),
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
