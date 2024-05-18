import 'package:flashlist_flutter/src/shared/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/connection_request_input.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/connection_request_row.dart';
import 'package:flashlist_flutter/src/features/users/presentation/user_avatar_row.dart';
import 'package:flashlist_flutter/src/shared/async_list_with_title.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// Screen for managing connections and requests.
/// [StatelessWidget] that holds the [ConnectionRequests] and the [ListRequestsWidget].
class ConnectionsScreen extends ConsumerWidget {
  const ConnectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(context.localizations.connectionsAndRequests),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            children: [
              gapH20, const ConnectionRequestInput(),
              gapH16,
              // * Pending requests to connect
              AsyncValueListWithTitle(
                title: context.localizations.pendingConnectionRequests,
                value: ref.watch(pendingRequestsProvider('connection')),
                listItemBuilder: (UserRequest? request) {
                  return ConnectionRequestRow(request!);
                },
              ),
              gapH20,
              // * List of connections
              AsyncValueListWithTitle(
                title: context.localizations.connections,
                value: ref.watch(connectionsProvider),
                listItemBuilder: (AppUser? connection) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserAvatarRow(username: connection!.username),
                      IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () async {
                            final wantsToRemove = await showConfirmDialog(
                              context: context,
                              title: context.localizations
                                  .removeConnection(connection.username),
                              confirmAction: context.localizations.share,
                              cancelAction: context.localizations.cancel,
                            );

                            if (wantsToRemove == true) {
                              ref
                                  .read(userControllerProvider)
                                  .removeConnection(connection.userId);
                            }
                          })
                    ],
                  );
                },
              ),
              gapH20,
              // * Pending requests to join a list
              // TODO: think about a nice way to display list invites
              // What info should be displayed?
              AsyncValueListWithTitle(
                title: context.localizations.pendingFlashlistRequests,
                value: ref.watch(pendingRequestsProvider('join_flashlist')),
                listItemBuilder: (UserRequest? request) {
                  return request != null
                      ? ConnectionRequestRow(request)
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
