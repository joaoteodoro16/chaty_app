import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/core/ui/widgets/app_button.dart';
import 'package:chaty_app/app/core/ui/widgets/app_text_form_field.dart';
import 'package:chaty_app/app/core/ui/widgets/loader.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/auth/presentation/shared/widgets/email_text_form_field.dart';
import 'package:chaty_app/app/features/contact/domain/entities/contact.dart';
import 'package:chaty_app/app/features/contact/domain/usecases/params/save_contact_params.dart';
import 'package:chaty_app/app/features/contact/presentation/register/cubit/create_contact_cubit.dart';
import 'package:chaty_app/app/features/contact/presentation/register/cubit/create_contact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class CreateContactPage extends StatefulWidget {
  final Contact? editingContact;
  const CreateContactPage({super.key, this.editingContact});

  @override
  State<CreateContactPage> createState() => _CreateContactPageState();
}

class _CreateContactPageState extends State<CreateContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _surnameEC = TextEditingController();
  final _emailEC = TextEditingController();

  @override
  void initState() {
    final editingContact = widget.editingContact;
    if (editingContact != null) {
      _nameEC.text = editingContact.name;
      _emailEC.text = editingContact.email.value;
      _surnameEC.text = editingContact.surname ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _surnameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateContactCubit, CreateContactState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => Loader.show(context),
          save: () {
            Loader.hide();
            context.toastSuccess("Contato salvo coms sucesso!");
          },
          error: (message) {
            Loader.hide();
            context.toastError(message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.editingContact == null ? 'Criar contado' : 'Editar ${widget.editingContact!.name}',
            style: context.textStyles.textRegular.copyWith(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                children: [
                  AppTextFormField(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.required("Campo obrigatório"),
                  ),
                  AppTextFormField(label: 'Apelido', controller: _surnameEC),
                  EmailTextFormField(controller: _emailEC),
                  AppButton.primary(
                    title: "Salvar",
                    onPressed: () {
                      final validate =
                          _formKey.currentState?.validate() ?? false;
                      if (validate) {
                        context.read<CreateContactCubit>().save(
                          saveContact: SaveContactParams(
                            name: _nameEC.text,
                            surname: _surnameEC.text,
                            email: _emailEC.text,
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
