import 'package:chaty_app/app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:chaty_app/app/features/splash/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SplashProvider {
  SplashProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => SplashCubit(getUserLoggedUsecase: context.read()),
      ),
    ],
    child: SplashPage(),
  );
}
