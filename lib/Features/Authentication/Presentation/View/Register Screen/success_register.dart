import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:task/Core/Extentions/center_ext.dart';
import 'package:task/Core/Extentions/extentions.dart';

import '../../../../../Core/Constants/asset_strings.dart';
import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_background.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../Login Screen/auth_screen.dart';

class SuccessRegister extends StatelessWidget {
  const SuccessRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPage(
        child: SafeArea(
            child: Scaffold(
      body: Stack(
        children: [
          AppBackGround(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gif(
                image: AssetImage(
                  IconStrings.successLogo,
                ),
                autostart: Autostart.loop,
                height: 198,
                width: 200,
              ).setCenter(),
              Text(
                'Your account\nwas successfully created!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo-Bold',
                  color: AppColors.natural100,
                  fontSize: 24,
                ),
              ),
              const Text(
                'Only one click to explore Hyperverse.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: AppColors.natural100,
                  fontSize: 16,
                ),
              ),
              MainAppButton(
                vertical: 0.08,
                bgColor: AppColors.primary500,
                child: const Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ).setCenter(),
                onTap: () {
                  AppNavigation.pushNamedAndRemoveUntil(AppRoutes.login);
                },
              ).setVerticalPadding(context, 0.08),
            ],
          ),
        ],
      ),
    )));
  }
}
