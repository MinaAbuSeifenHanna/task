import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../Features/Authentication/Presentation/Auth Bloc/auth_bloc.dart';
import '../../Features/Authentication/Presentation/View/Login Screen/login_screen.dart';
import '../../Features/Authentication/Presentation/View/Login Screen/reset_email_sent_screen.dart';
import '../../Features/Authentication/Presentation/View/Login Screen/reset_password_screen.dart';
import '../../Features/Authentication/Presentation/View/Register Screen/initail_register_screen.dart';
import '../../Features/Authentication/Presentation/View/Register Screen/register_password_screen.dart';
import '../../Features/Authentication/Presentation/View/Register Screen/register_screen.dart';
import '../../Features/Authentication/Presentation/View/Register Screen/success_register.dart';
import '../../Features/Authentication/Presentation/View/inital_screen.dart';

import '../Constants/strings_constants.dart';
import 'app_navigation.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.initial:
        return _screenRoute(
          screen: const InitialScreen(),
          settings: settings,
        );
      case AppRoutes.login:
        return _screenRoute(
          screen: BlocProvider(
            create: (context) => AuthBloc(),
            child: const Login(),
          ),
          settings: settings,
        );
      // case AppRoutes.bottomNavBar:
      //   return _screenRoute(
      //     screen: BlocProvider(
      //       create: (context) => BottomNavigationBarCubit(),
      //       child: BottomNavBar(),
      //     ),
      //     settings: settings,
      //   );
      case AppRoutes.resetEmailSent:
        return _screenRoute(
          screen: const ResetEmailSent(),
          settings: settings,
        );
      case AppRoutes.resetPasswordScreen:
        return _screenRoute(
          screen: const ResetPassword(),
          settings: settings,
        );
      case AppRoutes.initailRegisterScreen:
        return _screenRoute(
          screen: const InitilaRegisterScreen(),
          settings: settings,
        );
      case AppRoutes.registerScreen:
        return _screenRoute(
          screen: const RegisterScreen(),
          settings: settings,
        );
      case AppRoutes.registerPasswordScreen:
        return _screenRoute(
          screen: const RegisterPasswordScreen(),
          settings: settings,
        );
      case AppRoutes.successRegisterScreen:
        return _screenRoute(
          screen: const SuccessRegister(),
          settings: settings,
        );
      // case AppRoutes.home:
      //   return _screenRoute(
      //     screen: const HomeScreen(),
      //     settings: settings,
      //   );
      // case AppRoutes.storyScreen:
      //   return _screenRoute(
      //     screen: BlocProvider(
      //         create: (context) => StoryCubit(), child: const StoryScreen()),
      //     settings: settings,
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _screenRoute({
    Widget? screen,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(builder: (context) => screen!, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              StringsConstants.appName,
            ),
          ),
          body: Center(
            child: InkWell(
              onTap: () {
                Phoenix.rebirth(AppNavigation.currentContext);
              },
              child: const Text('Try again.'),
            ),
          ),
        );
      },
    );
  }
}
