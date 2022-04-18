import 'package:flutter/material.dart';
import 'package:maleda_hospital/shared/helpers/app_environment.dart';
import 'package:maleda_hospital/styles/app_colors.dart';

part 'dark_theme.dart';
part 'light_theme.dart';


class Themes {
// ThemeData themeData => WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
//     ? _DarkTheme.darkThemeData
//     // ? _DarkTheme.darkThemeData
//     : _LightTheme.lightThemeData;
ThemeData themeData(){
  return WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
    ? _DarkTheme.darkThemeData    : _LightTheme.lightThemeData;
}

  setTheme(BuildContext context) {
    return ThemeData(
        brightness:
            (WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light));
  }
}
