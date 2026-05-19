import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    primaryColor: AppColors.mainColor,
 scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: AppColors.darkGreyClr,
    scaffoldBackgroundColor: AppColors.darkGreyClr,
    brightness: Brightness.dark,
  );
}