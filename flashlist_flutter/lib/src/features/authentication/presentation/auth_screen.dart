import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import 'package:flashlist_flutter/src/utils/serverpod/serverpod_controller.dart';

class AuthScreen extends ConsumerWidget {
  /// AuthScreen is the default screen when the user is not authenticated
  /// currently only holds a button to sign in with email
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientProvider);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SignInWithEmailButton(
            caller: client.modules.auth,
            onSignedIn: () {},
          )
        ],
      )),
    );
  }
}
