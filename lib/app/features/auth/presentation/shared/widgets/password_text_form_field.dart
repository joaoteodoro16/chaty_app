import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class PasswordTextFormField extends AppTextFormField {
  final bool validateLength;

  PasswordTextFormField({
    super.key,
    this.validateLength = false,
    super.controller,
    super.label = 'Senha',
    super.isRequerid  
  }) : super(
         obscureText: true,
         validator: Validatorless.multiple(_buildValidators(validateLength)),
         prefixIcon: Icons.lock_sharp
       );
  static List<String? Function(String?)> _buildValidators(bool validateLength) {
    final validators = <String? Function(String?)>[];

    validators.add(Validatorless.required("Campo obrigatório!"));

    if (validateLength) {
      validators.add(
        Validatorless.min(6, "A senha deve ter pelo menos 6 caracteres!"),
      );
    }

    return validators;
  }
}
