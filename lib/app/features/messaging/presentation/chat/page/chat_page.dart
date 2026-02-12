import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/widgets/chat_list_widget.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/widgets/input_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final conversationId = args['conversationId'] as String;
    final otherUserId = args['otherUserId'] as String;
    final otherUserName = args['otherUserName'] as String;

    return FutureBuilder(
      future: context.read<GetUserLoggedUsecase>().call(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final me = snapshot.data!;
        final myUid = me.id!;

        // inicia a stream uma vez
        context.read<ChatCubit>().subscribe(conversationId: conversationId);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 54, 54, 54),
            title: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  otherUserName,
                  style: context.textStyles.textRegular
                      .copyWith(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ChatListWidget(myUid: myUid),
                ),
                InputMessageWidget(
                  conversationId: conversationId,
                  myUid: myUid,
                  otherUid: otherUserId,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
