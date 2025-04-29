import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/features/color_picker/application/color_picker_controller.dart';
import 'package:flashlist_flutter/src/features/edit_mode/application/edit_mode_panel_controller.dart';

part 'edit_mode_controller.g.dart';

/// A general controller for the edit mode.
/// To be used from the Widget tree.
/// When passing a Flashlist to [toggleEditMode] it opens the edit mode panel
/// When passing null to [toggleEditMode] it closes the edit mode panel
/// Edit Mode will also hold a text input for the Flashlist title.
/// This should be handled here.
class EditModeController {
  EditModeController({required this.ref});

  final Ref ref;

  void toggleEditMode(Flashlist? flashlist) {
    final editModePanelController =
        ref.read(editModePanelControllerProvider.notifier);

    final colorPickerController =
        ref.read(colorPickerControllerProvider.notifier);

    if (flashlist != null) {
      // To properly update this is called here and in the flashlist-card
      // TODO: refactor edit-mode-controller
      colorPickerController.takeInt(int.parse(flashlist.color));

      editModePanelController.togglePanel(flashlist.id);
    } else {
      editModePanelController.togglePanel(0);
    }
  }
}

@riverpod

/// Provider for the editModeController
EditModeController editModeController(Ref ref) => EditModeController(ref: ref);

@riverpod
TextEditingController flashlistTitleInputController(Ref ref) {
  return TextEditingController();
}
