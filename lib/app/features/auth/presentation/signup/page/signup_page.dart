import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/features/auth/domain/usecases/params/signup_params.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/password_text_form_field.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/cubit/signup_cubit.dart';
import 'package:chaty_app/app/features/auth/presentation/signup/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _nameEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          loaded: (){
            Loader.hide();
            Navigator.of(context).pop();
          },
          error: (message) {
            Loader.hide();
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png'),
                  Text(
                    'Criar minha conta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  AppTextFormField(
                    label: 'Como deseja ser chamado',
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required("Campo obrigatório!"),
                      Validatorless.min(
                        2,
                        "O nome deve ter pelo menos 2 caracteres",
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  EmailTextFormField(controller: _emailEC, isRequired: true),
                  const SizedBox(height: 10),
                  PasswordTextFormField(controller: _passwordEC),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    label: 'Confirmar senha',
                    validator: Validatorless.multiple([
                      Validatorless.required("Campo obrigatório!"),
                      Validatorless.compare(
                        _passwordEC,
                        "As senhas devem ser iguais!",
                      ),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  AppButton.primary(
                    title: 'Confirmar',
                    onPressed: () {
                      final validate =
                          _formKey.currentState?.validate() ?? false;
                      if (validate) {
                        context.read<SignupCubit>().signup(
                          params: SignupParams(
                            email: _emailEC.text,
                            password: _passwordEC.text,
                            name: _nameEC.text,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
