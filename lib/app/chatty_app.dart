import 'package:chaty_app/app/core/di/app_provider.dart';
import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChattyApp extends StatelessWidget {
  const ChattyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chaty',
        theme: ThemeData(
          fontFamily: AppTextStyles.font,
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF5AA0B4)),
          scaffoldBackgroundColor: AppColors.primaryBackGround,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primaryBackGround,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        routes: AppRoutes.routes,
      ),
    );
  }
}
