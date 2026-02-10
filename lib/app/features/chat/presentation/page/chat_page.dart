import 'package:chaty_app/app/features/chat/presentation/widgets/chat_list_widget.dart';
import 'package:chaty_app/app/features/chat/presentation/widgets/input_message_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 54, 54),
        title: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.amber,
              child: Icon(Icons.person, color: Colors.white),
            ),
            Text(
              'Cleisinho',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ChatListWidget(),
            ),
            InputMessageWidget()
          ],
        ),
      ),
    );
  }
}
