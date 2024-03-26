import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF39A552);
  static Color navyColor = const Color(0xFF4F5A69);
  static Color lightNavyColor = const Color(0xFF79828B);
  static Color blackColor = const Color(0xFF303030);
  static Color whiteColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: navyColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: navyColor,
      ),
    ),
  );
}
