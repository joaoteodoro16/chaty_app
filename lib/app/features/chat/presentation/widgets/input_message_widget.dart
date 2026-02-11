import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class InputMessageWidget extends StatelessWidget {
  const InputMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 54, 54, 54),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextFormField(
                  style: context.textStyles.textRegular.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 2,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_circle_right_sharp,
                color: AppColors.primary,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
