import 'package:flutter/material.dart';
import 'package:task/Core/Extentions/extentions.dart';

import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/app_background.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../Widget/register_check.dart';
import '../../Widget/register_taps.dart';
import '../Login Screen/auth_screen.dart';

class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen({super.key});

  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  double linearValue = 0;
  bool isPasswordEightCharacters = false;
  bool hasPasswordOneNumber = false;
  bool hasPasswordSymbol = false;

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
                    title: 'Create your password 2/2',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const RegisterTaps(index: 1),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )
                    ),
                    obscureText: true,
                    onTapOutside: (c) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    onChanged: onPasswordChanged,
                  ).setHorizontalAndVerticalPadding(context, 0.08, 0.06),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(4),
                    value: linearValue,
                    color: linearValue <= 1 / 4
                        ? Colors.red
                        : linearValue <= 2 / 4
                            ? Colors.amber
                            : linearValue <= 3 / 4
                                ? Colors.yellow
                                : Colors.green,
                  ).setHorizontalPadding(context, 0.08)
                  
                  ,
                  const SizedBox(height: 20),
                  RegisterCheck(
                    value: isPasswordEightCharacters,
                    text: '8 characters minimum',
                  ),
                  RegisterCheck(
                    value: hasPasswordOneNumber,
                    text: 'a number',
                  ),
                  RegisterCheck(
                    value: hasPasswordSymbol,
                    text: 'a symbol',
                  ),
                  MainAppButton(
                    vertical: 0.08,
                    bgColor: linearValue < 1.0
                        ? Colors.transparent
                        : AppColors.primary500,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).setCenter(),
                    onTap: linearValue < 1.0
                        ? () {}
                        : () {
                            AppNavigation.pushNamed(
                                AppRoutes.successRegisterScreen);
                          },
                  ).setVerticalPadding(context, 0.08),
                ],
              )
            ],
          ),
        )));
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final symbolRegex = RegExp(r'[^\w\s]');

    setState(() {
      linearValue = 0;
      isPasswordEightCharacters = false;
      if (password.length >= 8) {
        isPasswordEightCharacters = true;
        linearValue += 1 / 4;
      }
      hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) {
        hasPasswordOneNumber = true;
        linearValue += 1 / 4;
      }
      hasPasswordSymbol = false;
      if (symbolRegex.hasMatch(password)) {
        hasPasswordSymbol = true;
        linearValue += 2 / 4;
      }
    });
  }
}
