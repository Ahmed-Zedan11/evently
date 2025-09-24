import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/theme_manger.dart';
import 'core/routes_manger/routes_manger.dart';

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
        initialRoute: RoutesManger.mainLayout,
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
