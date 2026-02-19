import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/core/ui/widgets/search_text_form_field_widget.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_cubit.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_state.dart';
import 'package:chaty_app/app/features/contact/presentation/list/widgets/add_contact_button_widget.dart';
import 'package:chaty_app/app/features/contact/presentation/list/widgets/contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late ContactCubit _cubit;
  final _nameEC = TextEditingController();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cubit = context.read<ContactCubit>();
      _cubit.getContacts();
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactCubit, ContactState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          error: (message) {
            Loader.hide();
            context.toastError(message);
          },
          loaded: (contacts) {
            Loader.hide();
          },
          deletedContact: () {
            Loader.hide();
          },
          openChat: (conversationId, otherUserId, otherUserName) async {
            final cubit = context.read<ContactCubit>();
            Loader.hide();
            await Navigator.of(context).pushNamed(
              AppRoutes.chatPageRoute,
              arguments: {
                'conversationId': conversationId,
                'otherUserId': otherUserId,
                'otherUserName': otherUserName,
              },
            );
            cubit.getContacts();
          },

          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contatos', style: context.textStyles.textRegular),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddContactButtonWidget(),
              const SizedBox(height: 10),
              SearchTextFormFieldWidget(
                hint: 'Pesquisar contatos por nome',
                controller: _nameEC,
                onChanged: (name) {
                  if(name.isEmpty){
                    _cubit.clearFilter();
                  }else{
                    _cubit.filterContactsByName(name: name);
                  }
                },
              ),
              const SizedBox(height: 10),
              ContactListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
