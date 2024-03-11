import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Sign Out'),
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
