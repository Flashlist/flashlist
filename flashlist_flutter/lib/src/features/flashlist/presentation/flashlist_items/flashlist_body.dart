import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/flashlist_item.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/mixins/flashlist_item_deletion_handler.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_items/mixins/flashlist_item_reorder_handler.dart';

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

class FlashlistBodyState extends ConsumerState<FlashlistBody>
    with FlashlistItemDeletionHandler, FlashlistItemReorderHandler {
  late List<FlashlistItem?> flashlistItems;

  @override
  void initState() {
    super.initState();
    flashlistItems = widget.flashlist.items!;
  }

  @override
  List<FlashlistItem?> getFlashlistItems() => flashlistItems;

  @override
  void deleteItemOnRemote(int itemId, int parentId) {
    ref.read(flashlistControllerProvider).deleteFlashlistItem(
          DeleteFlashlistItem(
            id: itemId,
            parentId: parentId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final bodyItems =
        buildReorderableItems(flashlistItems, handleDebouncedDeletion);

    Widget proxyDecorator(
      Widget child,
      int index,
      Animation<double> animation,
    ) {
      return buildProxyDecorator(child, index, animation, bodyItems);
    }

    // If the flashlist has no items, display a placeholder
    // TODO: Add a nice placeholder or empty card
    // * maybe something informing the user how to edit and add items
    if (flashlistItems.isEmpty) {
      return const Text('No items placeholder');
    }

    // Return the ReorderableListView
    return ReorderableListView(
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      proxyDecorator: proxyDecorator,
      onReorder: handleFlashlistItemReorder,
      children: bodyItems,
    );
  }
}
