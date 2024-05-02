import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// An independent Widget reading the [flashlistForUserProvider] (Stream)
/// and displaying the flashlists in a list.
class FlashlistCollection extends HookConsumerWidget {
  const FlashlistCollection({
    super.key,
    required this.scrollController,
    required this.isAdding,
  });

  final ScrollController scrollController;
  final ValueNotifier<int> isAdding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// A StreamProvider to get the flashlists for the current user
    /// The flashlists will be updated in real-time
    final flashlistsForUser = ref.watch(flashlistsForUserProvider);

    return AsyncValueWidget(
      value: flashlistsForUser,
      data: (flashlists) {
        if (flashlists.isEmpty) {
          return Center(
            child: Text(context.localizations.noFlashlists),
          );
        }

        return ListView.builder(
          controller: scrollController,
          itemCount: flashlists.length,
          itemBuilder: (context, index) {
            flashlists.sort((a, b) => a!.createdAt.compareTo(b!.createdAt));
            final flashlist = flashlists[index];
            return FlashlistCard(
              flashlist: flashlist!,
              isAdding: isAdding.value == flashlist.id,
              toggleIsAdding: () {
                isAdding.value =
                    (isAdding.value == flashlist.id ? 0 : flashlist.id)!;
              },
            );
          },
        );
      },
    );
  }
}
