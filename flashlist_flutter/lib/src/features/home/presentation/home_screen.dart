import 'package:flashlist_flutter/src/branding/add_flashlist.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/presentation/edit_mode_overlay.dart';
import 'package:flutter/material.dart';

import 'package:flashlist_flutter/src/features/home/presentation/side_drawer.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  /// HomeScreen is the default screen when the user is authenticated
  /// Holds no [state], only UI.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editModeController = ref.watch(editModeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
      ),
      drawer: const SideDrawer(),
      floatingActionButton: editModeController.isEditMode
          ? null
          : FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              shape: const CircleBorder(),
              onPressed: () {
                // TODO: implement add flashlist
              },
              child: const AddFlashlistIcon(),
            ),
      body: EditModeOverlay(
        child: Center(
          child: Column(
            children: [
              // this is still here for testing purposes
              // Consumer(
              //   builder: (context, watch, child) {
              //     final color =
              //         ref.read(colorPickerControllerProvider).color.toColor();

              //     return AnimatedContainer(
              //       margin: const EdgeInsets.all(8),
              //       decoration: BoxDecoration(
              //         border: Border.all(color: color),
              //         borderRadius: BorderRadius.circular(4),
              //         color: color.withOpacity(0.2),
              //       ),
              //       duration: const Duration(milliseconds: 200),
              //       child: const SizedBox(
              //         height: 100,
              //         width: double.infinity,
              //         child: Center(
              //           child: Text('This is an example list'),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              AnimatedContainer(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ref
                        .watch(colorPickerControllerProvider)
                        .color
                        .toColor(),
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: ref
                      .watch(colorPickerControllerProvider)
                      .color
                      .toColor()
                      .withOpacity(0.2),
                ),
                duration: const Duration(milliseconds: 00),
                child: const SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: Text('This is an example list'),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(editModeControllerProvider.notifier)
                      .toggleEditMode();
                },
                child: const Text('Enter Edit mode'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
