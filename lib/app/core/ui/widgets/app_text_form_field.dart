import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool isRequerid;
  final TextInputType textInputType;

  const AppTextFormField({
    super.key,
    this.label = "",
    this.obscureText = false,
    this.controller,
    this.prefixIcon,
    this.validator,
    this.isRequerid = false,
    this.textInputType = TextInputType.text,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText ? !_showPassword : false,
      style: TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColors.primary)
            : null,
        suffixIcon: _passWordVisibleIconButtom(),
      ),
    );
  }

  Widget _passWordVisibleIconButtom() {
    return widget.obscureText
        ? IconButton(
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
          )
        : SizedBox.shrink();
  }
}
