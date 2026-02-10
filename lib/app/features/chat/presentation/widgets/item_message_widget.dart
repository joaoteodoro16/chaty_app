import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ItemMessageWidget extends StatelessWidget {
  final bool userMessage;
  const ItemMessageWidget({super.key, required this.userMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: userMessage
          ? AlignmentGeometry.centerRight
          : AlignmentGeometry.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200),
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
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.,",
                  style: TextStyle(color: Colors.white),
                  softWrap: true,
                ),
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '13:56',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Icon(Icons.check, size: 12, color: Colors.white),
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
