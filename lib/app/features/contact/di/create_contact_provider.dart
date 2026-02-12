import 'package:chaty_app/app/features/contact/data/datasources/remote/contracts/contact_remote_datasource.dart';
import 'package:chaty_app/app/features/contact/data/datasources/remote/impl/contact_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/contact/data/repositories/contact_repository_impl.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/domain/repositories/contact_repository.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/upsert_contact_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/impl/upsert_contact_usecase_impl.dart';
import 'package:chaty_app/app/features/contact/presentation/register/cubit/create_contact_cubit.dart';
import 'package:chaty_app/app/features/contact/presentation/register/page/create_contact_page.dart';
import 'package:chaty_app/app/features/user/data/datasources/contracts/user_remote_datasource.dart';
import 'package:chaty_app/app/features/user/data/datasources/impl/user_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/user/data/repositories/user_repository_impl.dart';
import 'package:chaty_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CreateContactProvider {
  CreateContactProvider();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<UserRemoteDatasource>(
        create: (context) => UserRemoteDatasourceImpl(cloud: context.read()),
      ),
      Provider<UserRepository>(
        create: (context) => UserRepositoryImpl(
          remote: context.read(),
          authLocalDatasource: context.read(),
        ),
      ),

      Provider<ContactRemoteDatasource>(
        create: (context) => ContactRemoteDatasourceImpl(cloud: context.read()),
      ),
      Provider<ContactRepository>(
        create: (context) => ContactRepositoryImpl(remote: context.read()),
      ),
      Provider<UpsertContactUsecase>(
        create: (context) => UpsertContactUsecaseImpl(
          contactRepository: context.read(),
          userRepository: context.read(),
        ),
      ),
      BlocProvider(
        create: (context) => CreateContactCubit(
          upsertContactUsecase: context.read(),
          getUserLoggedUsecase: context.read(),
        ),
      ),
    ],
    builder: (context, child) {
      final args = ModalRoute.of(context)?.settings.arguments as Contact?;
      return CreateContactPage(editingContact: args,);
    },
  );
}
