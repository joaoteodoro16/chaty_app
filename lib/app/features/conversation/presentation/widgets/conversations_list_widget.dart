import 'package:chaty_app/app/features/conversation/presentation/widgets/conversation_item_list.dart';
import 'package:flutter/material.dart';

class ConversationsListWidget extends StatelessWidget {
  const ConversationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return Divider(
          color: const Color.fromARGB(255, 43, 43, 43),
          height: .8,
        );
      },
      itemBuilder: (context, index) {
        return ConversationItemList();
      },
    );
  }
}
