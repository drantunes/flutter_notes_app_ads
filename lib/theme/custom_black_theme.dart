import 'package:flutter/material.dart';

class CustomBlackTheme {
  static bool isDark = false;

  static MaterialColor black = const MaterialColor(
    4280427042,
    {
      50: Color(0xfff0f0f0),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff1A1A1A)
    },
  );

  static getThemeData({required brightness}) {
    isDark = brightness == Brightness.dark;

    return ThemeData(
      brightness: brightness,
      primarySwatch: black,
      scaffoldBackgroundColor: _scaffoldBackgroundColor(),
      appBarTheme: _appBarTheme(),
      elevatedButtonTheme: _elevatedButtonThemeData,
      floatingActionButtonTheme: _fabThemeData(),
    );
  }

  static Color _scaffoldBackgroundColor() {
    return isDark ? Colors.grey.shade900 : Colors.grey.shade50;
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      elevation: 0,
      foregroundColor: isDark ? Colors.white : black,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: isDark ? black.shade500 : black.shade600,
      ),
    );
  }

  static FloatingActionButtonThemeData _fabThemeData() {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.greenAccent.shade200,
      foregroundColor: Colors.black,
      iconSize: 30,
      splashColor: Colors.greenAccent.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        side: BorderSide(
          color: black.shade600,
          width: isDark ? 0 : 1,
        ),
      ),
    );
  }

  static ButtonStyle get _elevatedButtonStyle {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ).copyWith(
      elevation: MaterialStateProperty.resolveWith<double>((states) => 0.0),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: _elevatedButtonStyle,
    );
  }
}
