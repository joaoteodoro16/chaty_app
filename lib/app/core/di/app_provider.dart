import 'package:chaty_app/app/core/persistence/shared_preferences/app_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  final Widget child;
  const AppProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AppSharedPreferences(),)
      ],
      child: child,
    );
  }
}
