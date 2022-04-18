import 'package:maleda_hospital/modules/splash-screen/splash-screen.dart';
import 'package:maleda_hospital/shared/helpers/app_environment.dart';
import 'package:maleda_hospital/styles/theme/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// Custom imports
import 'package:maleda_hospital/routes.dart';
import 'package:maleda_hospital/shared/providers/name_notifier.dart';

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ClassName()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          darkTheme: Themes().themeData(), // standard dark theme
          themeMode: ThemeMode.system, 
          routes: Routes.routes,
          home: SplashScreen(),
        ));
  }
}
