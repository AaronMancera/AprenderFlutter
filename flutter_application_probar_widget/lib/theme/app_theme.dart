import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.teal;
  //LightTheme
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Color primario
    primaryColor: primaryColor,
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
  );
  //DarkTheme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Color primario
    primaryColor: primaryColor,
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
  );
}
