import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Não possui uma conta?',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.signupPageRoute);
          },
          child: Text(
            'Criar uma agora',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
