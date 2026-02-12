import 'package:chaty_app/app/features/conversation/domain/usecases/contracts/logout_usecase.dart';
import 'package:chaty_app/app/features/conversation/domain/usecases/impl/logout_usecase_impl.dart';
import 'package:chaty_app/app/features/conversation/presentation/cubit/conversation_cubit.dart';
import 'package:chaty_app/app/features/conversation/presentation/pages/conversation_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ConversationProvider {
  ConversationProvider._();

  static Widget get provider => MultiProvider(
    providers: [
      Provider<LogoutUsecase>(create: (context) => LogoutUsecaseImpl(authRepository: context.read()),),
      BlocProvider(create: (context) => ConversationCubit(logoutUsecase: context.read()),)
    ],
    child: ConversationPage(),
  );
}
