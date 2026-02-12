import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ItemMessageWidget extends StatelessWidget {
  final bool userMessage;
  final String text;
  final DateTime sentAt;

  const ItemMessageWidget({
    super.key,
    required this.userMessage,
    required this.text,
    required this.sentAt,
  });

  String _formatHour(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: userMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 260),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: context.textStyles.textRegular
                      .copyWith(color: Colors.white),
                  softWrap: true,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _formatHour(sentAt),
                      style: context.textStyles.textRegular
                          .copyWith(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.check, size: 12, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
