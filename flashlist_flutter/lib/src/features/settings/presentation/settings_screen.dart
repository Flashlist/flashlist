import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/settings/presentation/settings_items/app_version_info.dart';
import 'package:flashlist_flutter/src/features/settings/presentation/settings_items/delete_account.dart';
import 'package:flashlist_flutter/src/features/settings/presentation/settings_items/theme_brightness.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// Settings screen
/// ListView with settings as ListTile
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(context.localizations.settings),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          AppVersionInfo(),
          ThemeBrightness(),
          DeleteAccountSetting(),
        ],
      ),
    );
  }
}
