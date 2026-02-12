import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class EmailTextFormField extends AppTextFormField {
  EmailTextFormField({super.key,super.enabled, required TextEditingController controller, bool isRequired = false})
    : super(
        controller: controller,
        validator: Validatorless.multiple([
          Validatorless.required("Campo obrigatório!"),
          Validatorless.email("Digite um email válido!"),
        ]),
        isRequerid: isRequired,
        prefixIcon: Icons.email,
        label: 'Email',
        textInputType: TextInputType.emailAddress
      );
}
