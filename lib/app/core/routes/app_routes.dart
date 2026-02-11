import 'package:chaty_app/app/features/auth/di/login_provider.dart';
import 'package:chaty_app/app/features/auth/di/signup_provider.dart';
import 'package:chaty_app/app/features/chat/di/chat_provider.dart';
import 'package:chaty_app/app/features/contact/di/contacts_provider.dart';
import 'package:chaty_app/app/features/conversation/di/conversation_provider.dart';
import 'package:chaty_app/app/features/splash/di/splash_provider.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static String get splashPageRoute => "/";
  static String get loginPageRoute => "/auth/login";
  static String get signupPageRoute => "/auth/signup";
  static String get conversationsPageRoute => "/conversation";
  static String get contactsPageRoute => "/contacts";
  static String get chatPageRoute => "/chat";

  static Map<String, Widget Function(BuildContext)> get routes => {
    splashPageRoute: (context) => SplashProvider.provider,
    loginPageRoute: (context) => LoginProvider.provider,
    signupPageRoute: (context) => SignupProvider.provider,
    conversationsPageRoute: (context) => ConversationProvider.provider,
    chatPageRoute: (context) => ChatProvider.provider,
    contactsPageRoute: (context) => ContactsProvider.provider,
  };
}
