import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/authentication/presentation/auth_screen.dart';
import 'package:flashlist_flutter/src/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppRoute {
  home,
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) {
        return Consumer(
          builder: (context, ref, child) {
            final isAuthenticated = ref.watch(isAuthenticatedProvider);

            return isAuthenticated.when(
              data: (user) {
                if (user != null) {
                  return const HomeScreen();
                } else {
                  return const AuthScreen();
                }
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            );
          },
        );
      },
    ),
  ],
);