import 'package:maleda_hospital/modules/home/home-category.dart';
import 'package:maleda_hospital/modules/splash-screen/splash-screen.dart';
import 'package:flutter/cupertino.dart';
import './modules/auth/auth_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    '/auth': (BuildContext ctx) => AuthScreen(),
    '/splashScreen': (BuildContext ctx) => SplashScreen(),
    '/homeCatagory': (BuildContext ctx) => HomeCategory(),
    
  };
}
