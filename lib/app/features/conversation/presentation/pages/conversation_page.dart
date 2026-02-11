import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/conversation/presentation/widgets/conversations_list_widget.dart';
import 'package:chaty_app/app/core/ui/widgets/search_text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackGround,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackGround,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primary,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/contacts');
                },
                iconSize: 15,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Conversas',
                style: context.textStyles.textRegular.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 8),
              SearchTextFormFieldWidget(hint: 'Pesquisar contatos'),
              const SizedBox(height: 10),
              ConversationsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
