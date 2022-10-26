// Declare all app ThemeData.
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final ThemeData appThemeData = ThemeData(
    fontFamily: AppFonts.roboto,
    dividerColor: AppColors.separatorColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    focusColor: AppColors.primaryColor,
    disabledColor: AppColors.disabledColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryContrastColor,
      elevation: 1,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
    ),
  );
}
