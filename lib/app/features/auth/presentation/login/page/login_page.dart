import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/core/ui/widgets/loader_widget.dart';
import 'package:chaty_app/app/features/auth/presentation/login/cubit/login_cubit.dart';
import 'package:chaty_app/app/features/auth/presentation/login/cubit/login_state.dart';
import 'package:chaty_app/app/features/auth/presentation/login/widgets/signup_button.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit _cubit;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cubit = context.read<LoginCubit>();
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          loaded: () => Loader.hide(),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              spacing: 15,
              children: [
                Image.asset('assets/images/logo.png'),
                EmailTextFormField(controller: TextEditingController()),
                PasswordTextFormField(controller: TextEditingController()),
                AppButton.primary(
                  title: 'Acessar',
                  onPressed: () async{
                    _cubit.login(email: 'email', password: 'password');

                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   '/conversation',
                    //   (route) => false,
                    // );
                  },
                ),
                SignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
