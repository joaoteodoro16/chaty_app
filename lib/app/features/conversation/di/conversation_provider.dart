import 'package:chaty_app/app/features/conversation/presentation/pages/conversation_page.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConversationProvider {
  ConversationProvider._();

  static Widget get provider => MultiProvider(
    providers: [Provider(create: (context) => Object())],
    child: ConversationPage(),
  );
}
