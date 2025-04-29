import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/features/settings/domain/settings_state.dart';

part 'settings_controller.g.dart';

/// Settings Controller
/// Holds every method meant to mutate the state of the app settings
@riverpod
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() {
    return SettingsState();
  }

  void setBrightness(
    BuildContext context,
    Brightness? brightness,
    bool isSystem,
  ) {
    if (brightness == Brightness.light) {
      AdaptiveTheme.of(context).setLight();
    } else if (brightness == Brightness.dark) {
      AdaptiveTheme.of(context).setDark();
    } else if (isSystem) {
      AdaptiveTheme.of(context).setSystem();
    }
  }
}

@riverpod
Future<PackageInfo> appPackageInfo(Ref ref) async {
  return await PackageInfo.fromPlatform();
}
