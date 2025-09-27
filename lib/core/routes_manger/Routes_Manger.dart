import 'package:evently/features/auth/login/login.dart';
import 'package:evently/features/create_event/create_event.dart';
import 'package:evently/features/main_layout/main_Layout.dart';
import 'package:flutter/cupertino.dart';
import '../../features/auth/register/Register.dart';

abstract class RoutesManger {
  static const String register = "/register";
  static const String login = "/login";
  static const String mainLayout = "/mainLayout";
  static const String createEvent = "/createEvent";

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
      case mainLayout:
        {
          return CupertinoPageRoute(builder: (context) => const MainLayout());
        }
      case createEvent:
        {
          return CupertinoPageRoute(builder: (context) => const CreateEvent());
        }
    }
    return null;
  }
}
