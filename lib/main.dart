import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:evently/l10n/generated/app_localizations.dart';
import 'package:evently/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/theme/theme_manger.dart';
import 'core/routes_manger/routes_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init;
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => ConfigProvider(), child: const Evently()));
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? RoutesManger.login
            : RoutesManger.mainLayout,
        onGenerateRoute: RoutesManger.router,
        theme: ThemeManger.light,
        darkTheme: ThemeManger.dark,
        themeMode: configProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        locale: configProvider.currentLanguage,
      ),
    );
  }
}
