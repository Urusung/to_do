import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  canvasColor: Colors.black,
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
      secondaryContainer: Color.fromARGB(255, 44, 44, 47),
      tertiary: Colors.white,
      onTertiary: Color.fromARGB(255, 71, 71, 77),
      tertiaryFixed:
          Color.fromARGB(255, 108, 108, 112), //TextField IconButton 색상
      tertiaryContainer: Color.fromARGB(255, 120, 120, 126),
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromARGB(255, 28, 28, 30), //home_view Container 색상
      onSurface: Colors.black, //텍스트 색상
      outline: Color.fromARGB(255, 44, 44, 47), //앱바 테두리 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 28, 28, 30) //showModalBottomSheet 색상
      ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      //큰앱바
      letterSpacing: -0.13,
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      //작은앱바
      letterSpacing: -0.13,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      //제목
      letterSpacing: -0.13,
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      //그리드뷰 제목
      letterSpacing: -0.13,
      fontSize: 26,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      //그리드뷰 서브타이틀
      letterSpacing: -0.13,
      fontSize: 16,
      color: Color.fromARGB(255, 146, 146, 146),
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      letterSpacing: -0.13,
      fontSize: 16,
      color: Colors.deepPurple,
      fontWeight: FontWeight.w400,
    ),
    //리스트뷰
    bodyLarge: TextStyle(
      letterSpacing: -0.13,
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      letterSpacing: -0.13,
      fontSize: 16,
      color: Color.fromARGB(255, 154, 154, 154),
      fontWeight: FontWeight.w400,
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
