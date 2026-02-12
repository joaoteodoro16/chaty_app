import 'package:chaty_app/app/features/user/data/datasources/contracts/user_remote_datasource.dart';
import 'package:chaty_app/app/features/user/data/datasources/impl/user_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/user/data/repositories/user_repository_impl.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/get_user_by_id_usecase.dart';
import 'package:chaty_app/app/features/user/domain/usecases/contracts/upsert_user_usecase.dart';
import 'package:chaty_app/app/features/user/domain/usecases/impl/get_user_by_id_usecase_impl.dart';
import 'package:chaty_app/app/features/user/domain/usecases/impl/upsert_user_usecase_impl.dart';
import 'package:chaty_app/app/features/user/presentation/bloc/user_cubit.dart';
import 'package:chaty_app/app/features/user/presentation/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserProvider {
  UserProvider._();

  static Widget get providers => MultiProvider(
    providers: [
      Provider<UserRemoteDatasource>(
        create: (context) => UserRemoteDatasourceImpl(cloud: context.read()),
      ),
      Provider<UserRepository>(
        create: (context) => UserRepositoryImpl(remote: context.read(), authLocalDatasource: context.read()),
      ),
      Provider<UpsertUserUsecase>(
        create: (context) =>
            UpsertUserUsecaseImpl(userRepository: context.read()),
      ),
      Provider<GetUserByIdUsecase>(
        create: (context) => GetUserByIdUsecaseImpl(
          authRepository: context.read(),
          userRepository: context.read(),
        ),
      ),
      BlocProvider(
        create: (context) => UserCubit(
          upsertUsecase: context.read(),
          getUserByIdUsecase: context.read(),
        ),
      ),
    ],
    child: UserPage(),
  );
}
