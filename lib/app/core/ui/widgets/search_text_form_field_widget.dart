import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/contact/presentation/list/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextFormFieldWidget extends StatefulWidget {
  final String hint;
  const SearchTextFormFieldWidget({super.key, required this.hint});

  @override
  State<SearchTextFormFieldWidget> createState() =>
      _SearchTextFormFieldWidgetState();
}

class _SearchTextFormFieldWidgetState extends State<SearchTextFormFieldWidget> {
  final _nameEC = TextEditingController();
  late ContactCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ContactCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        onChanged: (name) {
          if (name.isEmpty) {
            _cubit.filterContactsByName(name: name);
          } else {
            _cubit.clearFilter();
          }
        },
        style: TextStyle(color: Colors.white, fontSize: 16),
        controller: _nameEC,
        cursorHeight: 15,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 167, 167, 167),
          ),
          hintText: widget.hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          contentPadding: EdgeInsets.all(2),
          hintStyle: context.textStyles.textRegular.copyWith(
            color: const Color.fromARGB(255, 167, 167, 167),
          ),
        ),
      ),
    );
  }
}
