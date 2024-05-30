import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_body.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// A mixin handling the deletion of a FlashlistItem
/// Provides [handleDebouncedDeletion] to handle the deletion of a FlashlistItem
/// Shows a SnackBar with an undo action for 5 seconds
/// If the action is not undone, the item is deleted
mixin FlashlistItemDeletionHandler on ConsumerState<FlashlistBody> {
  /// Deletes the FlashlistItem on the remote from the consuming class
  void deleteItemOnRemote(int itemId, int parentId);

  /// Handles the deletion of a FlashlistItem by removing it from the FlashlistBody
  /// and showing a SnackBar with an undo action for 3 seconds
  /// If the action is not undone, the item is [deleteItemOnRemote]
  void handleDebouncedDeletion(
    BuildContext context,
    FlashlistItem item,
  ) {
    ref.read(flashlistControllerProvider).deleteFlashlistItem(
          DeleteFlashlistItem(
            id: item.id!,
            parentId: item.parentId,
          ),
        );

    context.showContextSnackBar(
      context,
      message: 'Item deleted',
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          ref.read(flashlistControllerProvider).insertFlashlistItem(
                InsertFlashlistItem(
                  item: item,
                ),
              );
        },
      ),
    );
  }
}
