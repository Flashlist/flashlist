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
      context.showContextSnackBar(context,
          message: context.localizations.requestSentMessage);
    }

    return Column(
      children: [
        Row(
          children: [
            Text(
              context.localizations.connect,
              style: const TextStyle(fontSize: Sizes.p16),
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      gapW16,
                      const Icon(Icons.person_add),
                      gapW16,
                      Text(context.localizations.email),
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onEditingComplete: () async {
                  await userController.sendConnectionRequestByEmail(
                    emailTextController.text,
                  );
                  showSnackBar();
                  emailTextController.clear();
                },
              ),
            ),
            // gapW12,
            // IconButton(
            //   onPressed: () async {
            //     await userController.sendConnectionRequestByEmail(
            //       emailTextController.text,
            //     );
            //     showSnackBar();
            //     emailTextController.clear();
            //   },
            //   icon: const Icon(Icons.send),
            // ),
          ],
        ),
      ],
    );
  }
}
