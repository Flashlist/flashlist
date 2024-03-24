import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';

class ShareViaEmail extends ConsumerWidget {
  const ShareViaEmail(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();

    void submitInvitation() {
      final client = ref.read(clientProvider);
      client.flashlist.sendStreamMessage(
        InviteUserToFlashlist(
          email: emailController.text,
          flashlistId: flashlist.id!,
          accessLevel: 'editor',
          userId: null,
        ),
      );
      Navigator.pop(context);
    }

    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            controller: emailController,
            onSubmitted: (_) => submitInvitation(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitInvitation,
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}
