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
      onSecondary: Color.fromARGB(255, 194, 194, 194),
      secondaryContainer: Colors.white,
      tertiary: Colors.black,
      onTertiary: Color.fromARGB(255, 228, 228, 230), //TextField 색상
      tertiaryFixed:
          Color.fromARGB(255, 182, 182, 184), //TextField IconButton 색상
      tertiaryContainer: Color.fromARGB(255, 178, 178, 181),
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white, //home_view Container 색상
      onSurface: Colors.black, //Text 색상
      outline: Color.fromARGB(255, 224, 224, 224), //AppBar BorderSide 색상
      surfaceContainerHighest:
          Color.fromARGB(255, 242, 242, 247) //showModalBottomSheet 색상
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
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      //제목
      letterSpacing: -0.13,
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      //그리드뷰 제목
      letterSpacing: -0.13,
      fontSize: 26,
      color: Colors.black,
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
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      letterSpacing: -0.13,
      fontSize: 16,
      color: Color.fromARGB(255, 154, 154, 154),
      fontWeight: FontWeight.w400,
    ),
    //힌트 텍스트
    labelMedium: TextStyle(
      letterSpacing: -0.13,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Color.fromARGB(255, 209, 209, 209),
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
