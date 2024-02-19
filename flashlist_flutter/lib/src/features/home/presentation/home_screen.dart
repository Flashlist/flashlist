import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionManager =
        ref.watch(serverpodControllerProvider).sessionManager;

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Home')),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              sessionManager.signOut();
            },
            child: const Text('Sign out'),
          ),
        ));
  }
}
