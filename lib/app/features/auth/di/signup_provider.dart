import 'package:chaty_app/app/features/auth/domain/usecases/contracts/signup_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/impl/signup_usecase_impl.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/page/signup_page.dart';
import 'package:chaty_app/app/features/user/data/datasources/contracts/user_remote_datasource.dart';
import 'package:chaty_app/app/features/user/data/datasources/impl/user_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/user/data/repositories/user_repository_impl.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SignupProvider {
  SignupProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<UserRemoteDatasource>(
        create: (context) => UserRemoteDatasourceImpl(cloud: context.read()),
      ),
      Provider<UserRepository>(
        create: (context) => UserRepositoryImpl(remote: context.read(), authLocalDatasource: context.read()),
      ),
      Provider<SignupUsecase>(
        create: (context) => SignupUsecaseImpl(
          authRepository: context.read(),
          userRepository: context.read(),
        ),
      ),
      BlocProvider(
        create: (context) => SignupCubit(signupUsecase: context.read()),
      ),
    ],
    child: SignupPage(),
  );
}
