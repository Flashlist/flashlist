import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';

class RequestControls extends HookConsumerWidget {
  /// Controls for a connection request.
  /// Can accept or decline a request.
  /// Once an action is taken, the controls are disabled.
  /// When Page is reloaded, the endpoints are called again and the entry is removed from the list.
  /// Requires a [requestId].
  const RequestControls({super.key, required this.request});

  final UserRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = ref.watch(userControllerProvider);

    final isAnswered = useState(false);

    return Row(
      children: [
        IconButton(
          tooltip: isAnswered.value
              ? 'Request already answered'
              : 'Accept connection request',
          onPressed: !isAnswered.value
              ? () async {
                  if (request.type == 'connection') {
                    await userController.acceptConnectionRequest(request.id!);
                  } else {
                    ref.read(flashlistControllerProvider).acceptFlashlistInvite(
                          AcceptInviteToFlashlist(
                            userId: request.userId2,
                            flashlistId: request.data!,
                            requestId: request.id!,
                            accessLevel: 'editor',
                          ),
                        );
                  }
                  isAnswered.value = true;
                }
              : null,
          icon: const Icon(Icons.check),
        ),
        IconButton(
          tooltip: isAnswered.value
              ? 'Request already answered'
              : 'Decline connection request',
          onPressed: !isAnswered.value
              ? () async {
                  await userController.removeRequest(request.id!);
                  isAnswered.value = true;
                }
              : null,
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
