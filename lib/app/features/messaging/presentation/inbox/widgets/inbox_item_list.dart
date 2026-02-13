import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/core/ui/util/date_time_formatter.dart';
import 'package:chaty_app/app/core/ui/widgets/confirm_dialog_widget.dart';
import 'package:chaty_app/app/features/messaging/domain/entities/user_conversation.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class InboxItemList extends StatelessWidget {
  final UserConversation conversation;
  const InboxItemList({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              final cubit = context.read<InboxCubit>();
              final confirmed = await ConfirmDialogWidget.show(
                context: context,
                title: 'Excluir conversa',
                description: 'Deseja realmente excluir essa conversa?',
              );

              if (confirmed == true) {
                cubit.deleteConversation(
                  conversationId: conversation.conversationId,
                );
              }
            },
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Excluir',
          ),
        ],
      ),
      child: InkWell(
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
                          DateTimeFormatter.formatHour(
                            conversation.lastMessageAt,
                          ),
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
      ),
    );
  }
}
