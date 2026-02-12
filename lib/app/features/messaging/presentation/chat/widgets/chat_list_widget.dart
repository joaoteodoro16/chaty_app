import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_state.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/widgets/item_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListWidget extends StatelessWidget {
  final String myUid;
  const ChatListWidget({super.key, required this.myUid});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text(message)),
          loaded: (conversationId, messages) {
            if (messages.isEmpty) {
              return const Center(child: Text('Nenhuma mensagem ainda'));
            }

            return ListView.separated(
              reverse: true, // como estamos ordenando desc no stream, isso ajuda
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ItemMessageWidget(
                  userMessage: msg.senderId == myUid,
                  text: msg.text,
                  sentAt: msg.sentAt,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 15),
            );
          },
        );
      },
    );
  }
}
