import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ConversationButtonAppBarWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  
  const ConversationButtonAppBarWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.primary,
        child: IconButton(
          onPressed:onPressed,
          iconSize: 18,
          padding: EdgeInsets.zero,
          icon:  Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
