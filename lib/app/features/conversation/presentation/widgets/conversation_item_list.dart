import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ConversationItemList extends StatelessWidget {
  const ConversationItemList({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cleisinho',
                        style: context.textStyles.textMedium.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '10:00',
                        style: context.textStyles.textRegular.copyWith(
                          color: const Color.fromARGB(255, 184, 184, 184),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hoje eu vou na academia sim',
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
