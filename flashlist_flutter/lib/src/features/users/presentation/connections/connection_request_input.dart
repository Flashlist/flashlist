import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// Widget for sending a connection request by email.
/// Holds a [TextField] for the email and a [IconButton] to send the request.
/// Does not provide any feedback; if a user with the given email exists,
class ConnectionRequestInput extends ConsumerWidget {
  const ConnectionRequestInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailTextController = TextEditingController();

    final userController = ref.watch(userControllerProvider);

    void showSnackBar() {
      showContextSnackBar(
        context,
        message:
            'Request sent. If a user with this email exists, they will receive a connection request.',
      );
    }

    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Connect with other users via email',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        gapH12,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: emailTextController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Of the user you want to connect with',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            gapW12,
            IconButton(
              onPressed: () async {
                await userController.sendConnectionRequestByEmail(
                  emailTextController.text,
                );
                showSnackBar();
                emailTextController.clear();
              },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ],
    );
  }
}
