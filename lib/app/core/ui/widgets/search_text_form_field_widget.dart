import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  final String hint;
  final void Function(String)? onChanged;
  final TextEditingController controller;

  const SearchTextFormFieldWidget({
    super.key,
    required this.hint,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white, fontSize: 16),
        controller: controller,
        cursorHeight: 15,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: const Color.fromARGB(255, 167, 167, 167),
          ),
          hintText: hint,
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
