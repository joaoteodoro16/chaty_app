import 'package:chaty_app/app/core/clients/auth/auth_client.dart';
import 'package:chaty_app/app/core/clients/auth/firebase/firebase_auth_client.dart';
import 'package:chaty_app/app/core/clients/cloud/cloud_client.dart';
import 'package:chaty_app/app/core/clients/cloud/firebase/firebase_firestore_client.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/impl/get_user_logged_usecase_impl.dart';
import 'package:chaty_app/app/core/persistence/shared_preferences/app_shared_preferences.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/contract/auth_local_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/local/impl/auth_local_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/contract/auth_remote_datasource.dart';
import 'package:chaty_app/app/features/auth/data/datasources/remote/impl/auth_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chaty_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AppSharedPreferences(),),
        Provider<CloudClient>(create: (context) => FirebaseCloudClient(),),

        //Auth
        Provider<AuthClient>(create: (context) => FirebaseAuthClient(),),
        Provider<AuthRemoteDatasource>(create: (context) => AuthRemoteDatasourceImpl(authClient: context.read()),),
        Provider<AuthLocalDatasource>(create: (context) => AuthLocalDatasourceImpl(preferences: context.read()),),
        Provider<AuthRepository>(create: (context) => AuthRepositoryImpl(remote: context.read(), local: context.read()),),
        Provider<GetUserLoggedUsecase>(create: (context) => GetUserLoggedUsecaseImpl(authRepository: context.read()),)
      ],
      child: child,
    );
  }
}
