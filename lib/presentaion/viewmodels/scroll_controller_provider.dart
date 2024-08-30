import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControllerOffsetProvider =
    StateNotifierProvider.autoDispose<ScrollNotifier, double>((ref) {
  return ScrollNotifier();
});

class ScrollNotifier extends StateNotifier<double> {
  final ScrollController scrollController = ScrollController();

  ScrollNotifier() : super(0.0) {
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    state = scrollController.offset;
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
