import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    canvasColor: Colors.transparent,
    primaryColor: AppColors.assets,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.background,
    cardColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: AppColors.assets,
      secondary: AppColors.white,
      surface: Colors.transparent,
      background: AppColors.background,
      error: AppColors.red,
      onPrimary: AppColors.assets,
      onSecondary: AppColors.assets,
      onSurface: AppColors.assets,
      onBackground: AppColors.background,
      onError: AppColors.assets,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        // ios
        statusBarBrightness: Brightness.light,
        // android
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: AppTextStyles.appBarTitle,
      color: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    fontFamily: 'SFPro',
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    canvasColor: Colors.transparent,
    primaryColor: AppColors.assets,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.background,
    cardColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: AppColors.assets,
      secondary: AppColors.white,
      surface: Colors.transparent,
      background: AppColors.background,
      error: AppColors.red,
      onPrimary: AppColors.assets,
      onSecondary: AppColors.assets,
      onSurface: AppColors.assets,
      onBackground: AppColors.background,
      onError: AppColors.assets,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        // ios
        statusBarBrightness: Brightness.light,
        // android
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: AppTextStyles.appBarTitle,
      color: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    fontFamily: 'SFPro',
  );
}
