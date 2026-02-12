import 'package:chaty_app/app/core/routes/app_routes.dart';
import 'package:chaty_app/app/core/ui/styles/app_colors.dart';
import 'package:chaty_app/app/core/ui/styles/app_text_styles.dart';
import 'package:chaty_app/app/features/messaging/presentation/inbox/cubit/inbox_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxDrawerWidget extends StatelessWidget {
  const InboxDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            color: AppColors.primaryBackGround,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Usuário",
                    style: context.textStyles.textMedium.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: AppColors.primaryBackGround,
                    ),
                    title: Text(
                      'Perfil',
                      style: context.textStyles.textRegular,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.userPageRoute);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: AppColors.primaryBackGround,
                    ),
                    title: Text(
                      'Sair',
                      style: context.textStyles.textRegular,
                    ),
                    trailing: const Icon(Icons.arrow_right),
                    onTap: () {
                      context.read<InboxCubit>().logout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
