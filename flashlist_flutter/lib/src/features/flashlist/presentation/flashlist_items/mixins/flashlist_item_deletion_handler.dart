import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_body.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// A mixin handling the deletion of a FlashlistItem
/// Provides [handleDebouncedDeletion] to handle the deletion of a FlashlistItem
/// Shows a SnackBar with an undo action for 5 seconds
/// If the action is not undone, the item is deleted
mixin FlashlistItemDeletionHandler on ConsumerState<FlashlistBody> {
  Completer<void>? completer;
  late Timer timer;
  late FlashlistItem pendingItem;
  int? pendingItemIndex;

  /// Gets the FlashlistItems from the consuming class
  List<FlashlistItem?> getFlashlistItems();

  /// Deletes the FlashlistItem on the remote from the consuming class
  void deleteItemOnRemote(int itemId, int parentId);

  /// Handles the deletion of a FlashlistItem by removing it from the FlashlistBody
  /// and showing a SnackBar with an undo action for 3 seconds
  /// If the action is not undone, the item is [deleteItemOnRemote]
  void handleDebouncedDeletion(
    BuildContext context,
    FlashlistItem item,
  ) {
    List<FlashlistItem?> flashlistItems = getFlashlistItems();

    // If there is a pending item, delete it and cancel the timer
    if (completer != null && !completer!.isCompleted) {
      timer.cancel();
      deleteItemOnRemote(item.id!, item.parentId);
    }

    completer = Completer<void>();
    pendingItem = item;
    pendingItemIndex = flashlistItems.indexOf(item);

    setState(() {
      flashlistItems.remove(item);
    });

    timer = Timer(const Duration(seconds: 3), () {
      if (!completer!.isCompleted) {
        deleteItemOnRemote(item.id!, item.parentId);
        completer!.complete();
      }
    });

    context.showContextSnackBar(
      context,
      message: 'Item deleted',
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          if (!completer!.isCompleted) {
            setState(() {
              if (flashlistItems.length < item.orderNr) {
                flashlistItems.add(item);
              } else {
                flashlistItems.insert(pendingItemIndex!, item);
              }
            });
            completer!.complete();
            timer.cancel();
          }
        },
      ),
    );
  }
}
