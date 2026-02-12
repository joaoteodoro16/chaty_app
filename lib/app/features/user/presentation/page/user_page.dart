import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/user/domain/usecases/params/save_user_params.dart';
import 'package:chaty_app/app/features/user/presentation/cubit/user_cubit.dart';
import 'package:chaty_app/app/features/user/presentation/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

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
          save: (message) {
            Loader.hide();
            context.toastSuccess(message);
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
                AppTextFormField(
                  label: 'Nome',
                  controller: _nameEC,
                  validator: Validatorless.required('Campo obrigatório'),
                ),
                EmailTextFormField(controller: _emailEC, enabled: false),
                AppButton.primary(
                  title: 'Salvar',
                  onPressed: () {
                    final validate = _formKey.currentState?.validate() ?? false;
                    if (validate) {
                      context.read<UserCubit>().save(
                        params: SaveUserParams(name: _nameEC.text),
                      );
                    }
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
