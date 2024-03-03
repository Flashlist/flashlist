import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import 'package:flashlist_flutter/src/features/serverpod/application/serverpod_controller.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverpodController = ref.watch(serverpodControllerProvider);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SignInWithEmailButton(
            caller: serverpodController.client.modules.auth,
            onSignedIn: () {},
          )
        ],
      )),
    );
  }
}
