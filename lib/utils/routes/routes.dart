import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_clean_architecture/utils/routes/route_name.dart';
import 'package:flutter_mvvm_clean_architecture/view/home_screen.dart';
import 'package:flutter_mvvm_clean_architecture/view/login_view.dart';
import 'package:flutter_mvvm_clean_architecture/view/signup_view.dart';
import 'package:flutter_mvvm_clean_architecture/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RouteName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
