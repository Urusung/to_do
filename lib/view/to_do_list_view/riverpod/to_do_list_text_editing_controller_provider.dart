import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleTextEditingControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final titleFocusNodeProvider = StateProvider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final isEmptyTitleTextProvider = StateProvider.autoDispose<bool>((ref) => true);

final noteTextEditingControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
