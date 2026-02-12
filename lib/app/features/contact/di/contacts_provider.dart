import 'package:chaty_app/app/features/contact/data/datasources/remote/contracts/contact_remote_datasource.dart';
import 'package:chaty_app/app/features/contact/data/datasources/remote/impl/contact_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/contact/data/repositories/contact_repository_impl.dart';
import 'package:chaty_app/app/features/contact/domain/repositories/contact_repository.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/delete_contact_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/contracts/get_contacts_usecase.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/impl/delete_contact_usecase_impl.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/impl/get_contacts_usecase_impl.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_cubit.dart';
import 'package:chaty_app/app/features/contact/presentation/list/pages/contacts_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ContactsProvider {
  ContactsProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<ContactRemoteDatasource>(
        create: (context) => ContactRemoteDatasourceImpl(cloud: context.read()),
      ),
      Provider<ContactRepository>(
        create: (context) => ContactRepositoryImpl(remote: context.read()),
      ),
      Provider<GetContactsUsecase>(
        create: (context) => GetContactsUsecaseImpl(repository: context.read()),
      ),
      Provider<DeleteContactUsecase>(
        create: (context) =>
            DeleteContactUsecaseImpl(contactRepository: context.read()),
      ),
      BlocProvider(
        create: (context) => ContactCubit(
          getUserLoggedUsecase: context.read(),
          getContactsUsecase: context.read(),
          deleteContactUsecase: context.read(),
        ),
      ),
    ],
    child: ContactsPage(),
  );
}
