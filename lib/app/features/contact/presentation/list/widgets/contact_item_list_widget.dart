import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactItemListWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemListWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.chatPageRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: context.textStyles.textMedium.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    contact.surname ?? '',
                    style: context.textStyles.textRegular.copyWith(
                      color: const Color.fromARGB(255, 184, 184, 184),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            Tooltip(
              message: 'Opções',
              child: PopupMenuButton<_ContactAction>(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onSelected: (value) async {
                  switch (value) {
                    case _ContactAction.edit:
                      final cubit = context.read<ContactCubit>();
                      await Navigator.of(context).pushNamed(
                        AppRoutes.createContactPageRoute,
                        arguments: contact,
                      );
                      cubit.getContacts();
                      break;
                    case _ContactAction.delete:
                      _showDeleteDialog(context, contact);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: _ContactAction.edit,
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 8),
                        Text('Editar'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: _ContactAction.delete,
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Excluir'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, Contact contact) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir contato'),
        content: Text('Tem certeza que deseja excluir ${contact.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ContactCubit>().deleteContact(
                contactUserId: contact.contactUserId,
              );
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

enum _ContactAction { edit, delete }
