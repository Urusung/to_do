import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  dialogBackgroundColor: const Color.fromARGB(255, 28, 28, 28),
  dividerColor: const Color.fromARGB(255, 70, 70, 70),
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
      secondary: Colors.white,
      onSecondary: Color.fromARGB(255, 84, 84, 84),
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromARGB(255, 28, 28, 28),
      onSurface: Colors.black, //텍스트 색상
      outline: Color.fromARGB(255, 28, 28, 28), //앱바 테두리 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 28, 28, 28) //showModalBottomSheet 색상
      ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      //큰앱바
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      //작은앱바
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      //제목
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      //소제목
      fontSize: 16,
      color: Color.fromARGB(255, 145, 145, 145),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 154, 154, 154),
      fontWeight: FontWeight.w400,
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
