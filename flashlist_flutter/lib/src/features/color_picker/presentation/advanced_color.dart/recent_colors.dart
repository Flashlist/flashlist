import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flashlist_flutter/src/utils/local_storage/local_storage_helper.dart';

/// RecentColors is a row of 8 colors that the user has recently used
/// Should be saved either in local storage or in a database
class RecentColors extends ConsumerWidget {
  const RecentColors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors =
        ref.watch(localStorageHelperProvider).recentColors.reversed.toList();

    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final color = colors.length > index
              ? Color(int.parse(colors[index]))
              : Colors.transparent;

          return GestureDetector(
            onTap: () {
              ref
                  .read(colorPickerControllerProvider.notifier)
                  .takeInt(int.parse(colors[index]));
              ref
                  .read(colorPickerControllerProvider.notifier)
                  .takeInt(int.parse(colors[index]));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorSchemeOf(context).onSurface,
                ),
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              width: (mediaQueryOf(context).size.width - Sizes.p42) / 8,
              height: Sizes.p40,
            ),
          );
        },
      ),
    );
  }
}
