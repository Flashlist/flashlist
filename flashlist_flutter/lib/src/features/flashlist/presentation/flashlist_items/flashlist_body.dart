import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_item.dart';

/// A widget to display the body of a flashlist.
/// Includes a [ReorderableListView] to display the flashlist items.
/// Each item is a [FlashlistItemWidget] that can be dismissed and reordered.
class FlashlistBody extends ConsumerStatefulWidget {
  const FlashlistBody({
    super.key,
    required this.flashlist,
  });

  final Flashlist flashlist;

  @override
  FlashlistBodyState createState() => FlashlistBodyState();
}

class FlashlistBodyState extends ConsumerState<FlashlistBody> {
  void deleteFlashlistItem(int parentId, int id) {
    ref.read(flashlistControllerProvider).deleteFlashlistItem(
          DeleteFlashlistItem(
            parentId: parentId,
            id: id,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final flashlistItems = widget.flashlist.items;

    // Define List of ReorderableDelayedDragStartListener
    final List<ReorderableDelayedDragStartListener> bodyItems = [
      if (flashlistItems != null && flashlistItems.isNotEmpty)
        for (final item in flashlistItems)
          ReorderableDelayedDragStartListener(
            index: flashlistItems.indexOf(item),
            key: Key('reorderable-${item!.id.toString()}'),
            child: FlashlistItemWidget(
              item: item,
              onDismissed: (direction) {
                deleteFlashlistItem(widget.flashlist.id!, item.id!);
              },
            ),
          ),
    ];

    // Define the proxyDecorator
    Widget proxyDecorator(
      Widget child,
      int index,
      Animation<double> animation,
    ) {
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

    // If the flashlist has no items, display a placeholder
    // TODO: Add a nice placeholder or empty card
    // * maybe something informing the user how to edit and add items
    if (flashlistItems == null || flashlistItems.isEmpty) {
      return const Text('No items placeholder');
    }

    // Return the ReorderableListView
    return ReorderableListView(
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      proxyDecorator: proxyDecorator,
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = flashlistItems.removeAt(oldIndex);
        flashlistItems.insert(newIndex, item);

        ref.read(flashlistControllerProvider).reOrderFlashlistItems(
              ReOrderFlashlistItem(
                id: item!.id!,
                parentId: widget.flashlist.id!,
                oldOrderNr: oldIndex + 1,
                newOrderNr: newIndex + 1,
              ),
            );
      },
      children: bodyItems,
    );
  }
}
