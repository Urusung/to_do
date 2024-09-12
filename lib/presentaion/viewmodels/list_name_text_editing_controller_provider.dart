import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listNameTextEditingControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final listNameFocusNodeProvider = StateProvider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final isEmptyListNameTextProvider = StateProvider<bool>((ref) => true);
