import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myListNameTextEditingControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final myListNameFocusNodeProvider = StateProvider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final isEmptyMyListNameTextProvider = StateProvider<bool>((ref) => true);
