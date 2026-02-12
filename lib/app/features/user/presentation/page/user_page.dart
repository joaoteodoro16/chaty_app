import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/user/presentation/bloc/user_cubit.dart';
import 'package:chaty_app/app/features/user/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<UserCubit>().getUser();
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          loadedUser: (user) {
            Loader.hide();
            _emailEC.text = user.email.value;
            _nameEC.text = user.name;
          },
          error: (message) {
            Loader.hide();
            context.toastError(message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 15,
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 40)),
                const SizedBox(height: 10),
                AppTextFormField(label: 'Nome', controller: _nameEC),
                EmailTextFormField(controller: _emailEC),
                AppButton.primary(
                  title: 'Salvar',
                  onPressed: () {
                    final validate = _formKey.currentState?.validate() ?? false;
                    if (validate) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
