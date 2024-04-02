import 'package:flashlist_flutter/src/features/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationBadge extends ConsumerWidget {
  const NotificationBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        context.goNamed(AppRoute.connections.name);
      },
      icon: const Icon(Icons.notifications),
    );
  }
}
