import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flashlist_flutter/src/features/edit_mode/domain/edit_mode_panel_state.dart';

part 'edit_mode_panel_controller.g.dart';

@riverpod

/// State Notifier class for the EditModePanel
/// EditModePanel utilizes lib/src/shared/sliding_panel to build EditModeOverlay
/// Allows to manipulate the EditModePanel state through,
/// [togglePanel],  [toggleAdvancedColor]
/// It can be called from anywhere in the app and will update the state
/// Holds the ID of the flashlist in edit mode if no flashlist is in edit mode it will be 0
class EditModePanelController extends _$EditModePanelController {
  @override
  EditModePanelState build() {
    return const EditModePanelState(
      isEditMode: false,
      isAdvancedColorExpanded: false,
      flashlistInEditMode: 0,
    );
  }

  void togglePanel(int? flashlistId) {
    state = state.copyWith(
      isEditMode: !state.isEditMode,
      flashlistInEditMode: state.flashlistInEditMode == 0 ? flashlistId : 0,
    );
    if (state.isAdvancedColorExpanded) {
      toggleAdvancedColor();
    }
  }

  void toggleAdvancedColor() {
    state = state.copyWith(
      isAdvancedColorExpanded: !state.isAdvancedColorExpanded,
    );
  }
}
