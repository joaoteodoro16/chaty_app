import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:flutter/material.dart';

class InboxItemList extends StatelessWidget {
  final UserConversation conversation;
  const InboxItemList({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.chatPageRoute,
          arguments: {
            'conversationId': conversation.conversationId,
            'otherUserId': conversation.otherUserId,
            'otherUserName': conversation.otherUserName,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        conversation.otherUserName,
                        style: context.textStyles.textMedium.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        _formatHour(conversation.lastMessageAt),
                        style: context.textStyles.textRegular.copyWith(
                          color: const Color.fromARGB(255, 184, 184, 184),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    conversation.lastMessage,
                    style: context.textStyles.textRegular.copyWith(
                      color: const Color.fromARGB(255, 184, 184, 184),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatHour(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
