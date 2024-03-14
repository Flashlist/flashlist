import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flutter/material.dart';

class UserAvatarRow extends StatelessWidget {
  /// A row with a user avatar and [username].
  const UserAvatarRow({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarPlaceholder(
          username: username,
          radius: Sizes.p20,
        ),
        gapW16,
        Text(username),
      ],
    );
  }
}
