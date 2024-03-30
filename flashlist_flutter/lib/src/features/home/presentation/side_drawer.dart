import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/branding/logo_branding_vertical.dart';
import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/routing/app_router.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: LogoBrandingVertical(),
          ),
          ListTile(
            title: Text(localizationsOf(context).profile),
            trailing: const Icon(Icons.person),
            onTap: () {
              context.goNamed(AppRoute.profile.name);
            },
          ),
          ListTile(
            title: Text(localizationsOf(context).connectionsAndRequests),
            trailing: const Icon(Icons.people),
            onTap: () {
              context.goNamed(AppRoute.connections.name);
            },
          ),
          ListTile(
            title: Text(localizationsOf(context).signOut),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () {
              ref.read(authenticationControllerProvider).signOut();
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
