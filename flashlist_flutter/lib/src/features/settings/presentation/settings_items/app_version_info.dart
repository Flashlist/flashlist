import 'package:flashlist_flutter/src/shared/async_value_widget.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/settings/application/settings_controller.dart';

class AppVersionInfo extends ConsumerWidget {
  const AppVersionInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(appPackageInfoProvider),
        data: (packageInfo) {
          return ListTile(
            title: Text(context.localizations.appVersion),
            subtitle: Text(packageInfo.version),
          );
        });
  }
}
