import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/request_controls.dart';
import 'package:flashlist_flutter/src/features/users/presentation/user_avatar_row.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

class PendingConnectionRequests extends ConsumerWidget {
  /// Widget for displaying the list of pending connection requests.
  /// Holds a list of requests and their controls.
  /// If there are no pending requests, returns an empty container.
  const PendingConnectionRequests({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(pendingRequestsProvider('connection')),
      data: (requests) {
        if (requests.isEmpty) {
          return const SizedBox();
        }

        return ListView.builder(
          itemCount: requests.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final request = requests[index];

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AsyncValueWidget(
                  value: ref.watch(userByIdProvider(request!.userId1)),
                  data: (user) => user == null
                      ? const SizedBox()
                      : UserAvatarRow(username: user.username),
                ),
                RequestControls(
                  requestId: request.id!,
                )
              ],
            );
          },
        );
      },
    );
  }
}
