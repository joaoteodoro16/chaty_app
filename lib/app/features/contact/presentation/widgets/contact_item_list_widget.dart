import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ContactItemListWidget extends StatelessWidget {
  const ContactItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/chat');
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
                  Text(
                    'Cleisinho',
                    style: context.textStyles.textMedium.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  Text(
                    'Sei que nada sei 😂',
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
    );
  }
}
