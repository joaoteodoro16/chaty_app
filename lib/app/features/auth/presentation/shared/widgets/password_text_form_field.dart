import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PasswordTextFormField extends AppTextFormField {
  PasswordTextFormField({
    super.key,
    bool validateLength = false,
    super.controller,
    TextEditingController? compareController,
  }) : super(
         label: compareController != null ? "Confirmar senha" : "Senha",
         obscureText: true,
         prefixIcon: Icons.lock_sharp,
         validator: Validatorless.multiple(
           _buildValidators(
             validateLength: validateLength,
             compareController: compareController,
           ),
         ),
       );

  static List<String? Function(String?)> _buildValidators({
    required bool validateLength,
    required TextEditingController? compareController,
  }) {
    final validators = <String? Function(String?)>[];

    validators.add(Validatorless.required("Campo obrigatório!"));

    if (compareController != null) {
      validators.add(
        Validatorless.compare(compareController, "As senhas devem ser iguais!"),
      );
    } else if (validateLength) {
      validators.add(
        Validatorless.min(6, "A senha deve ter pelo menos 6 caracteres!"),
      );
    }

    return validators;
  }
}
