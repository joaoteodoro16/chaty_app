import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Messager {
  Messager._();

  static void show(
    BuildContext context, {
    required String message,
    ToastificationType type = ToastificationType.info,
    Duration duration = const Duration(seconds: 5),
    ToastificationStyle style = ToastificationStyle.flat,
    Alignment alignment = Alignment.topCenter,
    IconData? icon,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: style,
      alignment: alignment,
      autoCloseDuration: duration,
      description: Text(message, style: context.textStyles.textMedium,),
      icon: icon == null ? null : Icon(icon),
    );
  }

  static void success(BuildContext context, String message) =>
      show(context, message: message, type: ToastificationType.success);

  static void info(BuildContext context, String message) =>
      show(context, message: message, type: ToastificationType.info);

  static void warning(BuildContext context, String message) =>
      show(context, message: message, type: ToastificationType.warning);

  static void error(BuildContext context, String message) =>
      show(context, message: message, type: ToastificationType.error);
}

extension ToastX on BuildContext {
  void toastSuccess(String msg) => Messager.success(this, msg);
  void toastError(String msg) => Messager.error(this, msg);
  void toastWarning(String msg) => Messager.warning(this, msg);
  void toastInfo(String msg) => Messager.info(this, msg);
}
