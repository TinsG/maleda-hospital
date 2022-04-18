part of 'themes.dart';

class _LightTheme {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Gilroy',
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.buttonColor,
      secondary: AppColors.scrollGlowColor,
    ),
    toggleableActiveColor: AppColors.buttonColor,
    appBarTheme: AppBarTheme(color: AppColors.buttonColor),
    scaffoldBackgroundColor: AppColors.inputActive,
    errorColor: AppColors.textError,
    focusColor: AppColors.inputActive,
    hoverColor: AppColors.inputDefault,
    disabledColor: AppColors.inputDisable,
    primaryColorLight: AppColors.inputDefault,
    backgroundColor: AppColors.white,
  );
}
