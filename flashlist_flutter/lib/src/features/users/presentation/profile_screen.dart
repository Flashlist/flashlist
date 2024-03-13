import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: AsyncValueWidget(
          value: ref.watch(currentUserProvider),
          data: (user) {
            if (user == null) {
              return const Center(
                child: Text('No user data available.'),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarPlaceholder(
                  username: user.username,
                ),
                const SizedBox(height: 20),
                Text('Name: ${user.username}'),
                Text('Email: ${user.email}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
