import 'package:chaty_app/app/features/chat/presentation/page/chat_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChatProvider {
  ChatProvider._();

  static Widget get provider => MultiProvider(
    providers: [Provider(create: (context) => Object())],
    child: ChatPage(),
  );
}
