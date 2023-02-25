import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.quicksand().fontFamily,
  scaffoldBackgroundColor: const Color.fromRGBO(15, 4, 76, 1),
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      background: Color.fromRGBO(15, 4, 76, 1),
      error: Colors.red,
      onBackground: Color.fromRGBO(20, 30, 97, 1),
      onError: Color.fromRGBO(238, 238, 238, 1),
      onPrimary: Color.fromRGBO(238, 238, 238, 1),
      onSecondary: Color.fromRGBO(238, 238, 238, 1),
      onTertiary: Color.fromRGBO(238, 238, 238, 1),
      onSurface: Color.fromRGBO(238, 238, 238, 1),
      primary: Color.fromRGBO(15, 4, 76, 1),
      secondary: Color.fromRGBO(20, 30, 97, 1),
      tertiary: Colors.red,
      surface: Color.fromRGBO(15, 4, 76, 1),
      primaryContainer: Color.fromRGBO(15, 4, 76, 1)),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 96, color: Colors.white),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 36, color: Colors.white),
    headlineSmall: TextStyle(fontWeight: FontWeight.bold),
    labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 96),
    labelMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    labelSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(const Color.fromRGBO(20, 30, 97, 1)),
    overlayColor:
        MaterialStateProperty.all(const Color.fromRGBO(20, 30, 97, 1)),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
      return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );
    }),
    backgroundColor:
        MaterialStateProperty.all(const Color.fromRGBO(20, 30, 97, 1)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    maximumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
  )),
); //dark theme

ThemeData light = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.quicksand().fontFamily,
  scaffoldBackgroundColor: Colors.lightBlue,
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Colors.lightBlue,
      error: Colors.red,
      onBackground: Colors.lightBlue,
      onError: Color.fromRGBO(238, 238, 238, 1),
      onPrimary: Color.fromRGBO(238, 238, 238, 1),
      onSecondary: Color.fromRGBO(238, 238, 238, 1),
      onTertiary: Color.fromRGBO(238, 238, 238, 1),
      onSurface: Color.fromRGBO(238, 238, 238, 1),
      primary: Colors.lightBlueAccent,
      secondary: Colors.lightBlue,
      tertiary: Colors.red,
      surface: Colors.lightBlue,
      primaryContainer: Colors.lightBlue),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 96, color: Colors.black),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 36, color: Colors.black),
    headlineSmall: TextStyle(fontWeight: FontWeight.bold),
    labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 96),
    labelMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    labelSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.all(Colors.lightBlueAccent),
    overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
      return const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );
    }),
    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
    foregroundColor: MaterialStateProperty.all(Colors.black),
    maximumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
  )),
); //light theme
