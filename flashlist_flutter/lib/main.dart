import 'package:flashlist_flutter/src/features/authentication/presentation/auth_screen.dart';
import 'package:flashlist_flutter/src/features/home/presentation/home_screen.dart';
import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(isAuthenticatedProvider);

    return MaterialApp(
      title: 'Serverpod Flutter Sandbox',
      home: isAuthenticated.when(
        data: (userInfo) {
          if (userInfo == null) {
            return const AuthScreen();
          } else {
            return const HomeScreen();
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
