import 'package:evently/features/auth/login/login.dart';
import 'package:flutter/cupertino.dart';
import '../../features/auth/register/Register.dart';

abstract class RoutesManger {
  static const String register = "/register";
  static const String login = "/login";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case register:
        {
          return CupertinoPageRoute(builder: (context) => const Register());
        }
      case login:
        {
          return CupertinoPageRoute(builder: (context) => const Login());
        }
    }
    return null;
  }
}
