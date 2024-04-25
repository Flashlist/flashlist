import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/settings/application/settings_controller.dart';

class ThemeBrightness extends ConsumerWidget {
  const ThemeBrightness({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBrightness = AdaptiveTheme.of(context).mode;

    return ListTile(
      title: Text(
        context.localizations.brightness,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: SegmentedButton(
        showSelectedIcon: false,
        segments: [
          ButtonSegment<String>(
            label: Text(context.localizations.light),
            value: 'light',
          ),
          ButtonSegment<String>(
            label: Text(context.localizations.dark),
            value: 'dark',
          ),
          ButtonSegment<String>(
            label: Text(context.localizations.system),
            value: 'system',
          ),
        ],
        selected: {
          currentBrightness == AdaptiveThemeMode.system
              ? 'system'
              : currentBrightness == AdaptiveThemeMode.dark
                  ? 'dark'
                  : 'light'
        },
        onSelectionChanged: (value) {
          value.first == 'system'
              ? ref
                  .read(settingsControllerProvider.notifier)
                  .setBrightness(context, null, true)
              : ref.read(settingsControllerProvider.notifier).setBrightness(
                    context,
                    value.first == 'light' ? Brightness.light : Brightness.dark,
                    false,
                  );
        },
      ),
    );
  }
}
