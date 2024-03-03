import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/authentication/presentation/auth_screen.dart';
import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';
import 'package:flashlist_flutter/src/features/shared/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final sessionManager = ref.read(sessionManagerProvider);
    // final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
      ),
      drawer: const SideDrawer(),
      body: const Column(
        children: [
          Center(
            child: Text('Welcome!'),
          ),
        ],
      ),
    );
  }
}
