import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';
import 'package:flashlist_flutter/src/shared/confirm_dialog.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// ShareWithConnections allows the user to share a flashlist with their connections
class ShareWithConnections extends ConsumerWidget {
  const ShareWithConnections(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void shareWithConnection(AppUser connection) {
      ref.read(flashlistControllerProvider).addUserToFlashlist(
            AddUserToFlashlist(
              user: connection,
              flashlistId: flashlist.id!,
              accessLevel: 'editor',
            ),
          );
      context.pop();
    }

    return AsyncValueWidget(
      withLoadingIndicator: false,
      value: ref.watch(connectionsProvider),
      onReloadPress: () => ref.invalidate(connectionsProvider),
      data: (connections) {
        if (connections.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have no connections yet.',
                textAlign: TextAlign.center,
              ),
              Text(
                'Go to "Connections and Requests" and send or accept an invite!',
                textAlign: TextAlign.center,
              ),
            ],
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: connections.length,
          itemBuilder: (context, index) {
            final connection = connections[index];

            if (connection == null) {
              return const SizedBox();
            }

            final authorIds =
                Set.from(flashlist.authors?.map((c) => c?.userId) ?? []);

            final isAuthor = authorIds.contains(connection.userId);

            return Opacity(
              opacity: isAuthor ? 0.3 : 1.0,
              child: ListTile(
                leading: AvatarPlaceholder(
                  radius: Sizes.p20,
                  username: connection.username,
                ),
                title: Text(connection.username),
                onTap: isAuthor
                    ? null
                    : () async {
                        final wantsToShare = await showConfirmDialog(
                          context: context,
                          title: context.localizations
                              .inviteNamedUser(connection.username),
                          content: context.localizations
                              .wantToInviteNamedUserMessage(
                            connection.username,
                            flashlist.title,
                          ),
                          confirmAction: context.localizations.share,
                          cancelAction: context.localizations.cancel,
                        );

                        if (wantsToShare == true) {
                          shareWithConnection(connection);
                        }
                      },
              ),
            );
          },
        );
      },
    );
  }
}
