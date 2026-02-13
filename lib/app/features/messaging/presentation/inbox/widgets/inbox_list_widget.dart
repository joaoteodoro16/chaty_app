import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_state.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/widgets/inbox_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxListWidget extends StatelessWidget {
  const InboxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<InboxCubit, InboxState, List<UserConversation>>(
      selector: (state) {
        return state.maybeWhen(
          loaded: (conversations) => conversations,
          orElse: () => <UserConversation>[],
        );
      },
      builder: (context, conversations) {
        return ListView.separated(
          itemCount: conversations.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Color.fromARGB(255, 43, 43, 43),
              height: .8,
            );
          },
          itemBuilder: (context, index) {
            return InboxItemList(conversation: conversations[index]);
          },
        );
      },
    );
  }
}

