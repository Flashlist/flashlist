import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist/flashlist_card.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

/// An independent Widget reading the [flashlistForUserProvider] (Stream)
/// and displaying the flashlists in a list.
class FlashlistCollection extends HookConsumerWidget {
  const FlashlistCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// A StreamProvider to get the flashlists for the current user
    /// The flashlists will be updated in real-time
    final flashlistsForUser = ref.watch(flashlistsForUserProvider);

    /// A ValueNotifier to keep track of which flashlist is being populated
    /// When [isAdding.value] is equal to a flashlist id,
    /// A TextField will be displayed to add a new item to that flashlist
    final isAdding = useState<int>(0);

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
