import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/branding/add_flashlist.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/presentation/edit_mode_overlay.dart';
import 'package:flashlist_flutter/src/features/flashlist/application/flashlist_controller.dart';
import 'package:flashlist_flutter/src/features/flashlist/presentation/flashlist_collection.dart';
import 'package:flashlist_flutter/src/features/home/presentation/notification_badge.dart';
import 'package:flashlist_flutter/src/features/home/presentation/side_drawer.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';
import 'package:flashlist_flutter/src/utils/serverpod/serverpod_helper.dart';

class HomeScreen extends HookConsumerWidget {
  /// HomeScreen is the default screen when the user is authenticated
  /// Holds no [state], only UI.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(serverpodHelperProvider);
    final editModeController = ref.watch(editModePanelControllerProvider);
    final flashlistController = ref.watch(flashlistControllerProvider);

    final ScrollController scrollController = ScrollController();

    /// A ValueNotifier to keep track of which flashlist is being populated
    /// When [isAdding.value] is equal to a flashlist id,
    /// A TextField will be displayed to add a new item to that flashlist
    final isAdding = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Center(),
        actions: const [NotificationBadge()],
      ),
      drawer: const SideDrawer(),
      floatingActionButton: editModeController.isEditMode || isAdding.value != 0
          ? null
          : FloatingActionButton(
              backgroundColor: isDarkThemeOf(context)
                  ? colorSchemeOf(context).onBackground
                  : colorSchemeOf(context).onBackground.withOpacity(0.8),
              shape: const CircleBorder(),
              onPressed: () {
                flashlistController.createFlashlist(
                  Flashlist(
                    uuid: const Uuid().v4(),
                    title: context.localizations.newFlashlist,
                    color: const Color(0xFF2bb673).value.toString(),
                    authors: [],
                    createdAt: DateTime.now(),
                    updatedAt: null,
                  ),
                );

                scrollController.animateTo(
                  scrollController.position.maxScrollExtent + 300,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );

                // * It might be cool to enter edit mode automatically after creating list.
              },
              child: const AddFlashlistIcon(),
            ),
      body: EditModeOverlay(
        child: FlashlistCollection(
          scrollController: scrollController,
          isAdding: isAdding,
        ),
      ),
    );
  }
}
