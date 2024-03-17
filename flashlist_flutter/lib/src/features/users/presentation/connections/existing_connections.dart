import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/user_avatar_row.dart';

class ExistingConnections extends ConsumerWidget {
  /// Widget for displaying the list of existing connections.
  const ExistingConnections({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(connectionsProvider).when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
          data: (connections) {
            if (connections.isEmpty) {
              return const SizedBox();
            }

            return ListView.builder(
              itemCount: connections.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final connection = connections[index];

                return UserAvatarRow(username: connection!.username);
              },
            );
          },
        );
  }
}
