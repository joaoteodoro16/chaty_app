import 'package:chaty_app/app/features/auth/presentation/signup/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupProvider {
  SignupProvider._();

  static Widget get provider =>
      MultiProvider(providers: [Provider(create: (context) => Object())], child: SignupPage(),);
}
