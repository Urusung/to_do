import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/theme/dark_theme.dart';
import 'package:to_do_list_riverpod/theme/light_theme.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(lightTheme);

  void changeTheme() {
    state = state == lightTheme ? darkTheme : lightTheme;
  }
}
