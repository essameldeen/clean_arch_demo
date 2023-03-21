import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0.0,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
      fontFamily: AppStrings.fontFamily,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            height: 1.3,
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ));
}
