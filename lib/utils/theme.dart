import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.indigo,
    backgroundColor: AppColors.indigo,
    accentColor: AppColors.white,
    textTheme: TextTheme(
      headline5: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.indigo,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
