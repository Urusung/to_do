import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
  canvasColor: Colors.white,
  dialogBackgroundColor: const Color.fromARGB(255, 242, 242, 247),
  dividerColor: const Color.fromARGB(255, 224, 224, 224),
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
      secondary: Colors.white,
      onSecondary: Color.fromARGB(255, 190, 190, 190),
      tertiary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white, //home_view Container 색상
      onSurface: Colors.black, //텍스트 색상
      outline: Color.fromARGB(255, 224, 224, 224), //앱바 테두리 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 242, 242, 247) //showModalBottomSheet 색상
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
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      //제목
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      //소제목
      fontSize: 16,
      color: Color.fromARGB(255, 154, 154, 154),
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 154, 154, 154),
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: Colors.deepPurple,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 247, 247, 247),
    ),
    backgroundColor: Color.fromARGB(255, 242, 242, 247),
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
