import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/contracts/get_user_logged_usecase.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/cubit/chat_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/widgets/chat_list_widget.dart';
import 'package:chaty_app/app/features/messaging/presentation/chat/widgets/input_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatCubit _chatCubit;

  String conversationId = "";
  String otherUserId = "";
  String otherUserName = "";

  bool _argsInitialized = false;
  bool _subscribed = false;

  @override
  void initState() {
    super.initState();
    // Cache do cubit enquanto o context ainda é seguro
    _chatCubit = context.read<ChatCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Pega argumentos uma única vez
    if (_argsInitialized) return;
    _argsInitialized = true;

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    conversationId = args['conversationId'] as String;
    otherUserId = args['otherUserId'] as String;
    otherUserName = args['otherUserName'] as String;
  }

  void _trySubscribe(String myUid) {
    if (_subscribed) return;
    if (conversationId.isEmpty) return;
    if (myUid.isEmpty) return;

    _subscribed = true;
    _chatCubit.subscribe(
      conversationId: conversationId,
      myUid: myUid,
    );
  }

  void _deleteTempIfNeeded() {
    // if (conversationId.isNotEmpty) {
    //   _chatCubit.deleteTempMessage(conversationId: conversationId);
    // }
  }

  @override
  void dispose() {
    _deleteTempIfNeeded();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

        // Subscribe só uma vez
        _trySubscribe(myUid);

        return PopScope(
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) return;
            _deleteTempIfNeeded();
          },
          child: Scaffold(
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
                    style: context.textStyles.textRegular.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: ChatListWidget(myUid: myUid)),
                  InputMessageWidget(
                    conversationId: conversationId,
                    myUid: myUid,
                    otherUid: otherUserId,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
