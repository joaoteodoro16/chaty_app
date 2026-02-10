import 'package:chaty_app/app/features/chat/presentation/widgets/item_message_widget.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<bool>.generate(5, (i) => i == 0);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemMessageWidget(userMessage: items[index]);
      },
      separatorBuilder: (_, __) => const SizedBox(height: 15),
    );
  }
}
