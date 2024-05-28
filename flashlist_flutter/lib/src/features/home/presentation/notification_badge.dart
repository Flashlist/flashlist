import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/routing/app_router.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

class NotificationBadge extends ConsumerWidget {
  const NotificationBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
        withLoadingIndicator: false,
        value: ref.watch(pendingRequestsProvider(null)),
        data: (pendingRequests) {
          return Stack(
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(AppRoute.connections.name);
                },
                icon: const Icon(Icons.notifications),
              ),
              if (pendingRequests.isNotEmpty)
                Positioned(
                  top: Sizes.p16,
                  right: Sizes.p16,
                  child: Container(
                    width: Sizes.p8,
                    height: Sizes.p8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          );
        });
  }
}
