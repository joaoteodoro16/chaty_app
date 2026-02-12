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
import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/datasources/remote/impl/messaging_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/messaging/data/repositories/messaging_repository_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/get_or_create_conversation_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/get_or_create_conversation_usecase_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ContactsProvider {
  ContactsProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<MessagingRemoteDatasource>(create: (context) => MessagingRemoteDatasourceImpl(context.read()),),
      Provider<MessagingRepository>(create: (context) => MessagingRepositoryImpl(remote: context.read()),),
      
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
      Provider<GetOrCreateConversationUsecase>(
        create: (context) => GetOrCreateConversationUsecaseImpl(repo: context.read()),
      ),
      BlocProvider(
        create: (context) => ContactCubit(
          getUserLoggedUsecase: context.read(),
          getContactsUsecase: context.read(),
          deleteContactUsecase: context.read(),
          getOrCreateConversationUsecase: context.read(),
        ),
      ),
    ],
    child: ContactsPage(),
  );
}
