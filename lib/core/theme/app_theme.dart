import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.white,
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.white,
      elevation: 0.5,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600)),
  scaffoldBackgroundColor: AppColors.background,

  // fontFamily: 'Georgia',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.assets),
);
