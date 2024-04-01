import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/settings/application/settings_controller.dart';

class ThemeBrightness extends ConsumerWidget {
  const ThemeBrightness({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBrightness = AdaptiveTheme.of(context).mode;

    return ListTile(
      leading: const Text('Theme brightness'),
      title: SegmentedButton(
        showSelectedIcon: false,
        segments: const [
          ButtonSegment<String>(
            label: Text('Light'),
            value: 'light',
          ),
          ButtonSegment<String>(
            label: Text('Dark'),
            value: 'dark',
          ),
          ButtonSegment<String>(
            label: Text('System'),
            value: 'system',
          ),
        ],
        selected: {
          currentBrightness == AdaptiveThemeMode.light
              ? 'light'
              : currentBrightness == AdaptiveThemeMode.dark
                  ? 'dark'
                  : 'system'
        },
        onSelectionChanged: (value) {
          value.first == 'system'
              ? ref
                  .read(settingsControllerProvider.notifier)
                  .setBrightness(context, null, true)
              : ref.read(settingsControllerProvider.notifier).setBrightness(
                  context,
                  value.first == 'light' ? Brightness.light : Brightness.dark,
                  false);
        },
      ),
    );
  }
}
