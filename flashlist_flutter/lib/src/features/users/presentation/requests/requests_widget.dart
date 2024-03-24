import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestsWidget extends ConsumerWidget {
  const RequestsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        value: ref.watch(pendingRequestsProvider('join_flashlist')),
        data: (requests) {
          if (requests == null || requests.isEmpty) {
            return const Center(
              child: Text('No pending requests.'),
            );
          }

          return Column(
            children: [
              const Text('Pending requests:'),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final request = requests[index];

                    return ListTile(
                      title: Text('Join request to ${request!.data}'),
                      subtitle: const Text(
                        'invitation',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          ref
                              .read(flashlistControllerProvider)
                              .acceptFlashlistInvite(
                                AcceptInviteToFlashlist(
                                  user: ref.read(currentUserProvider).value!,
                                  flashlistId: int.parse(request.data!),
                                  requestId: request.id!,
                                  accessLevel: 'editor',
                                ),
                              );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }
}
