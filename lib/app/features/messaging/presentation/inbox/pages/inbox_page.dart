import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/auth/domain/entities/user_account.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_cubit.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_state.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/widgets/inbox_button_app_bar_widget.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/widgets/inbox_drawer_widget.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/widgets/inbox_list_widget.dart';
import 'package:chaty_app/app/core/ui/widgets/search_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxPage extends StatefulWidget {
  final UserAccount userLogged;
  const InboxPage({super.key, required this.userLogged});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<InboxCubit>().subscribe();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InboxCubit, InboxState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          loaded: (conversations) {
            Loader.hide();
          },
          erro: (message) {
            Loader.hide();
            context.toastError(message);
          },
          deleteMessaging: () {
            Loader.hide();
            context.read<InboxCubit>().subscribe();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        drawer: InboxDrawerWidget(userLogged: widget.userLogged),
        backgroundColor: AppColors.primaryBackGround,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackGround,
          actions: [
            InboxButtonAppBarWidget(
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
                InboxListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
