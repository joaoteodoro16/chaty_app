import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/conversation/presentation/cubit/conversation_cubit.dart';
import 'package:chaty_app/app/features/conversation/presentation/cubit/conversation_state.dart';
import 'package:chaty_app/app/features/conversation/presentation/widgets/conversation_button_app_bar_widget.dart';
import 'package:chaty_app/app/features/conversation/presentation/widgets/conversation_drawer_widget.dart';
import 'package:chaty_app/app/features/conversation/presentation/widgets/conversations_list_widget.dart';
import 'package:chaty_app/app/core/ui/widgets/search_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConversationCubit, ConversationState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          loaded: () {
            Loader.hide();
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.loginPageRoute,
              (route) => false,
            );
          },
          erro: (message) {
            Loader.hide();
            context.toastError(message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        drawer: ConversationDrawerWidget(),
        backgroundColor: AppColors.primaryBackGround,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackGround,
          actions: [
            ConversationButtonAppBarWidget(
              icon: Icons.add,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.contactsPageRoute);
              },
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
      ),
    );
  }
}
