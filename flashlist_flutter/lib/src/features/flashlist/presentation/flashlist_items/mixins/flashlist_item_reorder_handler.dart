import 'dart:ui';

import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_body.dart';

/// A mixin handling the reordering of FlashlistItems
/// Provides [handleFlashlistItemReorder] to handle the reordering of FlashlistItems
/// Provides [buildReorderableItems] to build a list of ReorderableDelayedDragStartListener
/// Provides [buildProxyDecorator] to build a proxy decorator for the ReorderableListView
/// Expects [getFlashlistItems] to be implemented by the consuming class
mixin FlashlistItemReorderHandler on ConsumerState<FlashlistBody> {
  /// Takes a list of FlashlistItems and a function to handle the deletion of a FlashlistItem
  /// And Wraps the FlashlistItems in ReorderableDelayedDragStartListener
  List<ReorderableDelayedDragStartListener> buildReorderableItems(
    List<FlashlistItem?>? flashlistItems,
    Function(BuildContext, FlashlistItem) handleFlashlistItemDeletion,
  ) {
    if (flashlistItems == null) {
      return [];
    }

    return [
      for (final item in flashlistItems)
        ReorderableDelayedDragStartListener(
          index: flashlistItems.indexOf(item),
          key: Key('reorderable-${item!.id.toString()}'),
          child: FlashlistItemWidget(
            item: item,
            onDismissed: (direction) {
              handleFlashlistItemDeletion(context, item);
            },
          ),
        ),
    ];
  }

  /// Builds a proxy decorator around the FlashlistItem that is being reordered/grabbed
  Widget buildProxyDecorator(
      Widget child,
      int index,
      Animation<double> animation,
      List<ReorderableDelayedDragStartListener> bodyItems) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(1, 6, animValue)!;
        final double scale = lerpDouble(1, 1.02, animValue)!;
        return Transform.scale(
          scale: scale,
          child: Card(
            shape: const ContinuousRectangleBorder(),
            elevation: elevation,
            child: bodyItems[index].child,
          ),
        );
      },
      child: child,
    );
  }

  /// Handles the reordering of FlashlistItems
  void handleFlashlistItemReorder(int oldIndex, int newIndex) {
    final flashlistItems = widget.flashlist.items!;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = flashlistItems.removeAt(oldIndex);
    flashlistItems.insert(newIndex, item);

    int newOrderNr = newIndex + 1;
    if (newOrderNr > flashlistItems.length) {
      newOrderNr = flashlistItems.length;
    }

    ref.read(flashlistControllerProvider).reOrderFlashlistItems(
          ReOrderFlashlistItem(
            id: item!.id!,
            parentId: widget.flashlist.id!,
            oldOrderNr: oldIndex + 1,
            newOrderNr: newOrderNr,
          ),
        );
  }
}
