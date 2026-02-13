import 'package:chaty_app/app/features/messaging/data/datasources/remote/contracts/messaging_remote_datasource.dart';
import 'package:chaty_app/app/features/messaging/data/datasources/remote/impl/messaging_remote_datasource_impl.dart';
import 'package:chaty_app/app/features/messaging/data/repositories/messaging_repository_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/delete_conversation_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/send_message_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/contracts/watch_messages_usecase.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/delete_conversation_usecase_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/send_message_usecase_impl.dart';
import 'package:chaty_app/app/features/messaging/domain/usecases/impl/watch_messages_usecase_impl.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/page/chat_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ChatProvider {
  ChatProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<MessagingRemoteDatasource>(
        create: (context) => MessagingRemoteDatasourceImpl(context.read()),
      ),
      Provider<MessagingRepository>(
        create: (context) => MessagingRepositoryImpl(remote: context.read()),
      ),
      Provider<SendMessageUsecase>(
        create: (context) => SendMessageUsecaseImpl(repo: context.read()),
      ),
      Provider<WatchMessagesUsecase>(
        create: (context) => WatchMessagesUsecaseImpl(repo: context.read()),
      ),
      Provider<DeleteConversationUsecase>(create: (context) => DeleteConversationUsecaseImpl(repository: context.read()),),
      BlocProvider(
        create: (context) => ChatCubit(
          watchMessagesUsecase: context.read(),
          sendMessageUsecase: context.read(),
          deleteConversationUsecase: context.read(),
          getUserLogged: context.read(),
        ),
      ),
    ],
    child: ChatPage(),
  );
}
