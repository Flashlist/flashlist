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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            children: [
              const ConnectionRequestInput(),
              gapH16,
              Container(
                padding: const EdgeInsets.all(Sizes.p16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorSchemeOf(context).secondaryContainer,
                  borderRadius: BorderRadius.circular(Sizes.p24),
                ),
                child: Text(context.localizations.connectViaEmailMessage),
              ),
              gapH8,
              // * List of connections
              AsyncValueListWithTitle(
                title: context.localizations.connections,
                value: ref.watch(connectionsProvider),
                onReloadPress: () => ref.invalidate(connectionsProvider),
                listItemBuilder: (AppUser? connection) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserAvatarRow(username: connection!.username),
                      IconButton(
                          icon: const Icon(Icons.person_remove),
                          onPressed: () async {
                            final wantsToRemove = await showConfirmDialog(
                              context: context,
                              title: context.localizations
                                  .removeConnection(connection.username),
                              confirmAction: context.localizations.remove,
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
              // * Pending requests to connect
              AsyncValueListWithTitle(
                title: context.localizations.pendingConnectionRequests,
                value: ref.watch(pendingRequestsProvider('connection')),
                onReloadPress: () => ref.invalidate(pendingRequestsProvider),
                listItemBuilder: (UserRequest? request) {
                  return ConnectionRequestRow(request!);
                },
              ),
              gapH20,
              // * Pending requests to join a list
              // TODO: think about a nice way to display list invites
              // What info should be displayed?
              AsyncValueListWithTitle(
                title: context.localizations.pendingFlashlistRequests,
                value: ref.watch(pendingRequestsProvider('join_flashlist')),
                onReloadPress: () => ref.invalidate(pendingRequestsProvider),
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
