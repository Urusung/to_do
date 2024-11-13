import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorPickerProvider =
    StateNotifierProvider.autoDispose<ColorPickerNotifier, Color>((ref) {
  return ColorPickerNotifier();
});

class ColorPickerNotifier extends StateNotifier<Color> {
  ColorPickerNotifier() : super(Colors.deepPurple);

  void selectColor(Color color) {
    state = color;
  }
}
