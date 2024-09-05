import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';

class ListNameInput extends ConsumerWidget {
  const ListNameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorPickerProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42.0),
              color: selectedColor,
              boxShadow: [
                BoxShadow(
                  color: selectedColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.listUl,
                size: 42,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(18),
          TextField(
            cursorColor: Colors.blue,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'List Name',
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding:
                  const EdgeInsets.only(left: 0, right: 0), // 커서와 텍스트의 위치를 조정
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            onTap: () {
              // 텍스트 입력 시 커서가 자동으로 텍스트 바로 앞에 위치하도록 설정
              // 필요 시 추가 논리가 들어갈 수 있습니다.
            },
          ),
        ],
      ),
    );
  }
}
