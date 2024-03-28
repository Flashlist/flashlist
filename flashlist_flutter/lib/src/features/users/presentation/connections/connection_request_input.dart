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
        message: localizationsOf(context).requestSentMessage,
      );
    }

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                localizationsOf(context).connectWithOtherUsersViaEmail,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18),
              ),
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
                  labelText: localizationsOf(context).email,
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
