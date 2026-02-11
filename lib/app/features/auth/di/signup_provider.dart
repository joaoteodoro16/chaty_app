import 'package:chaty_app/app/core/clients/auth/auth_client.dart';
import 'package:chaty_app/app/core/clients/auth/firebase/firebase_auth_client.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/impl/auth_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/signup_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/impl/signup_usecase_impl.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SignupProvider {
  SignupProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<AuthClient>(create: (context) => FirebaseAuthClient(),),
      Provider<AuthRemoteDatasource>(create: (context) => AuthRemoteDatasourceImpl(authClient: context.read()),),
      Provider<AuthRepository>(create: (context) => AuthRepositoryImpl(remote: context.read()),),
      Provider<SignupUsecase>(create: (context) => SignupUsecaseImpl(authRepository: context.read()),),
      BlocProvider(create: (context) => SignupCubit(signupUsecase: context.read()),)
    ],
    child: SignupPage(),
  );
}
