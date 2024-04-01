import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/settings/presentation/settings_items/theme_brightness.dart';

/// Settings screen
/// ListView with settings as ListTile
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizationsOf(context).settings),
      ),
      body: const ThemeBrightness(),
    );
  }
}
