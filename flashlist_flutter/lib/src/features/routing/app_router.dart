import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/authentication/presentation/auth_screen.dart';
import 'package:flashlist_flutter/src/features/home/presentation/home_screen.dart';
import 'package:flashlist_flutter/src/features/settings/presentation/settings_screen.dart';
import 'package:flashlist_flutter/src/features/users/presentation/screens/connections_screen.dart';
import 'package:flashlist_flutter/src/features/users/presentation/screens/profile_screen.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

enum AppRoute {
  home,
  profile,
  connections,
  settings,
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Home Route (default) - checks if user is authenticated
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) {
        return Consumer(
          builder: (context, ref, child) {
            return AsyncValueWidget(
              value: ref.watch(isAuthenticatedProvider),
              data: (user) {
                if (!user) {
                  return const AuthScreen();
                } else {
                  return const HomeScreen();
                }
              },
            );
          },
        );
      },
      routes: [
        // Profile Page
        GoRoute(
          path: 'profile',
          name: AppRoute.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
        // Connections and Requests Page
        GoRoute(
          path: 'connections',
          name: AppRoute.connections.name,
          builder: (context, state) => const ConnectionsScreen(),
        ),
        GoRoute(
          path: 'settings',
          name: AppRoute.settings.name,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
