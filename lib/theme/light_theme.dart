import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.deepPurple, //대표 색상
      onPrimary: Colors.white,
      secondary: Color.fromARGB(255, 247, 247, 247), //스크롤시 네비게이션바 색상
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromARGB(255, 224, 224, 224), //ListView 줄 색상
      onSurface: Colors.black, //텍스트 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 242, 242, 247) //showModalBottomSheet 색상
      ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 247, 247, 247),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.black,
    focusColor: Colors.deepPurpleAccent,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
);
