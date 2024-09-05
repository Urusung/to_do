import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';

class ColorPicker extends ConsumerWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorPickerProvider);
    List<Color> colorList = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.deepPurple,
      Colors.brown,
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: colorList.map(
          (color) {
            return GestureDetector(
              onTap: () {
                ref.read(colorPickerProvider.notifier).selectColor(color);
              },
              child: Container(
                width: 46,
                height: 46,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: selectedColor == color
                      ? Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 3,
                        )
                      : Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 3,
                        ),
                ),
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
