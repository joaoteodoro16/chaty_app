import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AddContactButtonWidget extends StatelessWidget {
  const AddContactButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 99, 99, 99),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 10,
            children: [
              Icon(Icons.person, color: AppColors.primary),
              Text(
                'Adicionar contato',
                style: context.textStyles.textBold.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
