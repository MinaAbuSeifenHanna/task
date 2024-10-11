import 'package:flutter/material.dart';

import '../../../../../Core/Extentions/extentions.dart';
import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/app_background.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../../../../Features/Authentication/Presentation/View/Login%20Screen/auth_screen.dart';
import '../../../../../Features/Authentication/Presentation/Widget/or_widget.dart';
import '../../../../../Features/Authentication/Presentation/Widget/register_taps.dart';

class InitilaRegisterScreen extends StatelessWidget {
  const InitilaRegisterScreen({super.key});

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
                  const Text(
                    'Begin with creating new free account.\n This helps you keep your learning\n way easier.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ).setVerticalPadding(context, 0.15),
                  MainAppButton(
                    vertical: 0.08,
                    bgColor: AppColors.primary500,
                    child: const Text(
                      'Continue with email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).setCenter(),
                    onTap: () {
                      AppNavigation.pushNamed(AppRoutes.registerScreen);
                    },
                  ),
                  const ORWidget().setHorizontalAndVerticalPadding(context, 0.10, 0.03),
                  ...['Apple', 'Facebook', 'Google'].map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MainAppButton(
                        vertical: .08,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset('assets/icons/$e.png'),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Continue with $e',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
