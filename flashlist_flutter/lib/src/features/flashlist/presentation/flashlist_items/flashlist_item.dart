import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flutter/material.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';

/// A Widget to display a FlashlistItem
/// Dismissible with background color of error
/// Holds all information the user needs to see about a FlashlistItem
/// [item] is the FlashlistItem to display
/// [onDismissed] is the function to call when the item is dismissed
class FlashlistItemWidget extends StatelessWidget {
  const FlashlistItemWidget({
    super.key,
    required this.item,
    required this.onDismissed,
  });

  final FlashlistItem item;
  final void Function(DismissDirection direction) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key('dismissible-${item.id.toString()}'),
      onDismissed: onDismissed,
      background: Container(
        decoration: BoxDecoration(
          color: colorSchemeOf(context).error,
        ),
        margin: EdgeInsets.symmetric(
          vertical: themeOf(context).cardTheme.margin!.vertical / 2,
        ),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Center(
            child: Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
