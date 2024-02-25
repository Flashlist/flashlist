import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/authentication/presentation/auth.dart';
import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager = ref.read(serverpodControllerProvider).sessionManager;
    final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: isAuthenticated.when(
        data: (userInfo) {
          if (userInfo == null) {
            return const AuthButtons();
          } else {
            // TODO: Implement sibling of AuthButtons for authenticated users
            // So Home-Screen should return either AuthButtons or "FlashlistListScreen"
            return Column(
              children: [
                const Center(
                  child: Text('Welcome!'),
                ),
                ElevatedButton(
                  onPressed: () {
                    sessionManager.signOut();
                  },
                  child: const Text('Sign Out'),
                ),
              ],
            );
          }
        },
        error: (error, stackTrace) => Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        ),
        loading: () => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
