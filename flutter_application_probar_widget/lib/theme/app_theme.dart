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
    //TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: const StadiumBorder(),
        elevation: 0,
      )
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
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
