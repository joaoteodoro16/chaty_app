import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_cubit.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_state.dart';
import 'package:chaty_app/app/features/contact/presentation/list/widgets/contact_item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ContactCubit, ContactState, List<Contact>>(
      selector: (state) => state.maybeWhen(
        loaded: (contacts) => contacts,
        orElse: () => const <Contact>[],
      ),
      builder: (context, contacts) {
        if (contacts.isEmpty) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Text(
                  'Nenhum contato adicionado',
                  style: context.textStyles.textMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }

        return Expanded(
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ContactItemListWidget(contact: contact);
            },
            separatorBuilder: (context, index) => const Divider(
              color: Color.fromARGB(255, 43, 43, 43),
              height: .8,
            ),
            itemCount: contacts.length,
          ),
        );
      },
    );
  }
}
