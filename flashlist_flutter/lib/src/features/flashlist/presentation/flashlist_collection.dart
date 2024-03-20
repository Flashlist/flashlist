import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_card.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

/// An independent Widget reading the [flashlistForUserProvider] (Stream)
/// and displaying the flashlists in a list.
class FlashlistCollection extends ConsumerWidget {
  const FlashlistCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashlistsForUser = ref.watch(flashlistsForUserProvider);

    return AsyncValueWidget(
      value: flashlistsForUser,
      data: (flashlists) {
        if (flashlists.isEmpty) {
          return const Center(
            child: Text('No flashlists yet'),
          );
        }

        return ListView.builder(
          itemCount: flashlists.length,
          itemBuilder: (context, index) {
            final flashlist = flashlists[index];
            return FlashlistCard(
              flashlist: flashlist!,
            );
          },
        );
      },
    );
  }
}
