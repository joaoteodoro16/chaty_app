import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmDialogWidget {
  ConfirmDialogWidget._();

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title, style: context.textStyles.textRegular),
          content: Text(
            description,
            style: context.textStyles.textRegular.copyWith(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(
                'Não',
                style: context.textStyles.textMedium.copyWith(
                  color: AppColors.error,
                  fontSize: 17,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(
                'Sim',
                style: context.textStyles.textMedium.copyWith(fontSize: 17),
              ),
            ),
          ],
        );
      },
    );
  }
}
