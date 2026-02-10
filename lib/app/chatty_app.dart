import 'package:chaty_app/app/core/di/app_provider.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/auth/di/login_provider.dart';
import 'package:chaty_app/app/features/auth/di/signup_provider.dart';
import 'package:chaty_app/app/features/chat/di/chat_provider.dart';
import 'package:chaty_app/app/features/contact/di/contacts_provider.dart';
import 'package:chaty_app/app/features/conversation/di/conversation_provider.dart';
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
        routes: {
          "/": (context) => LoginProvider.provider,
          "/signup": (context) => SignupProvider.provider,
          '/conversation': (context) => ConversationProvider.provider,
          '/chat': (context) => ChatProvider.provider,
          '/contacts': (context) => ContactsProvider.provider,
        },
      ),
    );
  }
}
