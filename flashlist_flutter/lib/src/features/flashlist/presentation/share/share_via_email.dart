import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
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
      context.pop();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      height: 40,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  controller: emailController,
                  onSubmitted: (_) => submitInvitation(),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: submitInvitation,
                child: const Text('Send'),
              ),
            ],
          ),
          gapH24,
          Container(
            padding: const EdgeInsets.all(Sizes.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: const Text(
              'You can invite a user here via email. If a user with the provided email exists, they will receive your invitation',
              style: TextStyle(fontSize: Sizes.p16),
            ),
          ),
        ],
      ),
    );
  }
}
