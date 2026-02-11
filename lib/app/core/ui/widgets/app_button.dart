import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final AppButtonTypeEnum type;
  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  const AppButton._({
    required this.type,
    required this.backgroundColor,
    required this.titleColor,
    required this.title,
    this.height = 49,
    this.width = double.infinity,
    this.onPressed,
  });

  factory AppButton.primary({
    required String title,
    double width = double.infinity,
    double height = 49,
    VoidCallback? onPressed,
  }) {
    return AppButton._(
      title: title,
      type: AppButtonTypeEnum.primary,
      backgroundColor: AppColors.primary,
      titleColor: Colors.white,
      height: height,
      width: width,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        child: Text(
          title,
          style: context.textStyles.textRegular.copyWith(
            fontSize: 18,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}

enum AppButtonTypeEnum { primary, secondary }
