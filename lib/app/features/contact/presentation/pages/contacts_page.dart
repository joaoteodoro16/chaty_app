import 'package:chaty_app/app/core/ui/widgets/search_text_form_field_widget.dart';
import 'package:chaty_app/app/features/contact/presentation/widgets/add_contact_button_widget.dart';
import 'package:chaty_app/app/features/contact/presentation/widgets/contact_item_list_widget.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AddContactButtonWidget(),
            const SizedBox(height: 10),
            SearchTextFormFieldWidget(hint: 'Pesquisar contatos por nome'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) {
                  return ContactItemListWidget();
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Color.fromARGB(255, 43, 43, 43),
                    height: .8,
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
