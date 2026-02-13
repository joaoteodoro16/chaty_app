import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/datasources/remote/impl/messaging_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/messaging/data/repositories/messaging_repository_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/logout_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_user_conversations_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/logout_usecase_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/watch_user_conversations_usecase_impl.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/pages/inbox_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class InboxProvider {
  InboxProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<MessagingRemoteDatasource>(create: (context) => MessagingRemoteDatasourceImpl(context.read()),),
      Provider<MessagingRepository>(create: (context) => MessagingRepositoryImpl(remote: context.read()),),
      Provider<LogoutUsecase>(
        create: (context) => LogoutUsecaseImpl(authRepository: context.read()),
      ),
      Provider<WatchUserConversationsUsecase>(create: (context) => WatchUserConversationsUsecaseImpl(repo: context.read()),),
      BlocProvider(
        create: (context) => InboxCubit(
          logoutUsecase: context.read(),
          watchUserConversationsUsecase: context.read(),
          getUserLoggedUsecase: context.read()
        ),
      ),
    ],
    child: InboxPage(),
  );
}
