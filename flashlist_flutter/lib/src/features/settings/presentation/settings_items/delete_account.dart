import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/authentication/application/authentication.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/shared/confirm_dialog.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

class DeleteAccountSetting extends ConsumerWidget {
  const DeleteAccountSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void popContextAndShowMessage() {
      context.pop();

      context.showContextSnackBar(
        context,
        message:
            'Your account has been successfully deleted. Thank you for trying out Flashlist',
      );
    }

    return ListTile(
      title: const Text('Delete Account'),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Delete your account permanently',
            style: TextStyle(color: colorSchemeOf(context).error),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () async {
              final wantsToDelete = await showConfirmDialog(
                context: context,
                title: 'Delete Account',
                content:
                    'Are you sure you want to delete your account? This action cannot be undone!',
                cancelAction: 'No',
                confirmAction: 'Yes',
              );

              if (wantsToDelete != null) {
                bool isDeleted =
                    await ref.read(userControllerProvider).deleteUser();
                if (isDeleted) {
                  ref.read(authenticationControllerProvider).signOut();
                  popContextAndShowMessage();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
