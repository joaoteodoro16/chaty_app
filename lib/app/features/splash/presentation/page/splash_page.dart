import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/widgets/logo_app_widget.dart';
import 'package:chaty_app/app/core/ui/widgets/messager.dart';
import 'package:chaty_app/app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:chaty_app/app/features/splash/presentation/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().getUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (user) {
            final route = user != null
                ? AppRoutes.conversationsPageRoute
                : AppRoutes.loginPageRoute;

            Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
          },
          error: (message) {
            context.toastError(message);
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.loginPageRoute, (_) => false);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: state.when(
              initial: () => const LogoAppWidget(),
              loading: () => const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoAppWidget(),
                  SizedBox(height: 16),
                  CircularProgressIndicator(),
                ],
              ),
              loaded: (_) => const LogoAppWidget(),
              error: (message) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LogoAppWidget(),
                  const SizedBox(height: 16),
                  Text(message, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
