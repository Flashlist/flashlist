import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/connections/request_controls.dart';
import 'package:flashlist_flutter/src/features/users/presentation/user_avatar_row.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

class ConnectionRequestRow extends ConsumerWidget {
  const ConnectionRequestRow(
    this.request, {
    super.key,
  });

  final UserRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (request.data == null)
          AsyncValueWidget(
            withLoadingIndicator: false,
            value: ref.watch(userByIdProvider(request.userId1)),
            data: (user) => UserAvatarRow(username: user!.username),
          ),
        gapW8,
        RequestControls(
          request: request,
        )
      ],
    );
  }
}
