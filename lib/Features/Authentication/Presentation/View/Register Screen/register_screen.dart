import 'package:flutter/material.dart';
import 'package:task/Core/Extentions/extentions.dart';

import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/app_background.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../Widget/register_taps.dart';
import '../Login Screen/auth_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(
        showTermsPolicy: true,
        child: SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              AppBackGround(),
              Column(
                children: [
                  GenralAppbar(
                    title: 'Add your email 1/2',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const RegisterTaps(index: 0),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Email",
                     labelStyle: TextStyle(
                       color: Colors.white
                     ),

                    ),
                    onTapOutside: (c) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                  ).setHorizontalAndVerticalPadding(context, 0.08, 0.06),
                  MainAppButton(
                    vertical: 0.08,
                    bgColor: AppColors.primary500,
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).setCenter(),
                    onTap: () {
                      AppNavigation.pushNamed(AppRoutes.registerPasswordScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
