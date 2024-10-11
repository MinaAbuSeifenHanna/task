import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../Auth Bloc/auth_bloc.dart';
import '../../Widget/or_widget.dart';
import 'auth_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final authBloc = context.read<AuthBloc>();
    return AuthPage(
      showTermsPolicy: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GenralAppbar(
                  title: "Log into account",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ...[
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) => Form(
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                          ),
                          TextFormField(
                            obscureText: state.passHidden,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.white
                              ),
                              suffixIcon: IconButton(
                                onPressed: () => authBloc.add(TogglePassHiddenEvent()),
                                icon: Icon(
                                  state.passHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                  color: AppColors.natural300,
                                ),
                              ),
                            ),
                            onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),

                          MainAppButton(
                            bgColor: AppColors.primary500,
                            onTap: () => AppNavigation.pushNamed(AppRoutes.bottomNavBar),
                            child: Text(
                              "Log in ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.resetPasswordScreen);
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
                const ORWidget(),
                SizedBox(
                  height: size.height * 0.01,
                ),
                ...['Apple', 'Facebook', 'Google'].map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: MainAppButton(
                      /*style: const ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 40),
                        ),
                        maximumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      onPressed: () {},*/
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
