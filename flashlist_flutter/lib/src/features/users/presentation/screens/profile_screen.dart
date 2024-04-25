import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// Screen for managing [UserProfile]
/// WIP
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(context.localizations.profile),
      ),
      body: Center(
        child: AsyncValueWidget(
          value: ref.watch(currentUserProvider),
          data: (user) {
            if (user == null) {
              return Center(
                child: Text(context.localizations.noUserData),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (user.imageSrc == null)
                  AvatarPlaceholder(
                    username: user.username,
                  )
                else
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(user.imageSrc!),
                  ),
                gapH32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${context.localizations.name}: ',
                      style: textThemeOf(context).titleMedium,
                    ),
                    Text(user.username),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${context.localizations.email}: ',
                      style: textThemeOf(context).titleMedium,
                    ),
                    Text(user.email),
                  ],
                ),
                gapH20,
              ],
            );
          },
        ),
      ),
    );
  }
}
