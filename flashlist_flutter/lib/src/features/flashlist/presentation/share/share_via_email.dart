import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';

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
                  decoration: InputDecoration(
                    labelText: context.localizations.email,
                    border: const OutlineInputBorder(),
                  ),
                  controller: emailController,
                  onSubmitted: (_) => submitInvitation(),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: submitInvitation,
                child: Text(context.localizations.send),
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
            child: Text(
              context.localizations.inviteUsersViaEmailMessage,
              style: const TextStyle(fontSize: Sizes.p16),
            ),
          ),
        ],
      ),
    );
  }
}
