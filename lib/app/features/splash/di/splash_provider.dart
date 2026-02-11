import 'package:chaty_app/app/core/clients/auth/auth_client.dart';
import 'package:chaty_app/app/core/clients/auth/firebase/firebase_auth_client.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/contract/auth_local_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/impl/auth_local_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/impl/auth_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chaty_app/app/features/splash/domain/usecases/contract/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/splash/domain/usecases/contract/get_user_logged_usecase_impl.dart';
import 'package:chaty_app/app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:chaty_app/app/features/splash/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashProvider {
  SplashProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<AuthClient>(create: (context) => FirebaseAuthClient()),
      Provider<AuthRemoteDatasource>(create: (context) => AuthRemoteDatasourceImpl(authClient: context.read()),),
      Provider<AuthLocalDatasource>(create: (context) => AuthLocalDatasourceImpl(preferences: context.read()),),
      Provider<AuthRepository>(create: (context) => AuthRepositoryImpl(remote: context.read(), local: context.read()),),
      Provider<GetUserLoggedUsecase>(create: (context) => GetUserLoggedUsecaseImpl(repository: context.read()),),
      BlocProvider(
        create: (context) => SplashCubit(getUserLoggedUsecase: context.read()),
      ),
    ],
    child: SplashPage(),
  );
}
