import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.deepPurple, //대표 색상
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 24, 24, 24), //스크롤시 네비게이션바 색상
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromARGB(255, 28, 28, 28), //ListView 줄 색상
      onSurface: Colors.black, //텍스트 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 28, 28, 28) //showModalBottomSheet 색상
      ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromARGB(255, 28, 28, 28),
    ),
    backgroundColor: Colors.black,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);
