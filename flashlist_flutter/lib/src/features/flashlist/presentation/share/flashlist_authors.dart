import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/user_avatar_row.dart';
import 'package:flashlist_flutter/src/shared/confirm_dialog.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// FlashlistAuthors displays the authors of a flashlist
/// and allows the owner to remove a user from the flashlist
class FlashlistAuthors extends ConsumerWidget {
  const FlashlistAuthors(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authors = flashlist.authors;

    void removeFlashlistAuthor(AppUser author) {
      ref.read(flashlistControllerProvider).removeUserFromFlashlist(
            RemoveUserFromFlashlist(
              userId: author.userId,
              flashlistId: flashlist.id!,
            ),
          );
      context.pop();
    }

    if (authors == null || authors.isEmpty) {
      return Center(
        child: Text(context.localizations.noEditorsMessage),
      );
    }

    return ListView.builder(
      itemCount: flashlist.authors?.length,
      itemBuilder: (context, index) {
        final author = authors[index];

        return ListTile(
          title: UserAvatarRow(
            username: author!.username,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final wantsToShare = await showConfirmDialog(
                context: context,
                title: context.localizations.removeNamedUser(author.username),
                confirmAction: context.localizations.remove,
                cancelAction: context.localizations.cancel,
              );

              if (wantsToShare == true) {
                removeFlashlistAuthor(author);
              }
            },
          ),
        );
      },
    );
  }
}
