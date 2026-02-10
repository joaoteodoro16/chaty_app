import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Text(
                'Criar minha conta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              EmailTextFormField(
                controller: TextEditingController(),
                isRequired: true,
              ),
              const SizedBox(height: 10),
              PasswordTextFormField(
                controller: TextEditingController(),
                isRequerid: true,
              ),
              const SizedBox(height: 10),
              PasswordTextFormField(label: 'Confirmar senha', isRequerid: true),
              const SizedBox(height: 15),
              AppButton.primary(title: 'Confirmar', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
