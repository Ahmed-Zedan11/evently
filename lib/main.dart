import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/ThemeManger.dart';
import 'core/routes_manger/Routes_Manger.dart';

void main() {
  runApp(const Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        initialRoute: RoutesManger.register,
        onGenerateRoute: RoutesManger.router,
        theme: ThemeManger.light,
        darkTheme: ThemeManger.dark,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        locale: Locale("en"),
      ),
    );
  }
}
