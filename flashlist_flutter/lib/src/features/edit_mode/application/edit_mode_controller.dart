import 'package:flashlist_flutter/src/features/edit_mode/domain/edit_mode_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_mode_controller.g.dart';

@riverpod

/// State Notifier class for the edit mode
/// Allows to manipulate the edit mode state through,
/// [toggleEditMode], [startEditMode], [toggleAdvancedColor]
/// It can be called from anywhere in the app and will update the state
/// It will later have to hold a uuid or id to identify which flashlist is being edited
class EditModeController extends _$EditModeController {
  @override
  EditModeState build() {
    return const EditModeState(
      isEditMode: false,
      isAdvancedColorExpanded: false,
    );
  }

  void toggleEditMode() {
    state = state.copyWith(
      isEditMode: !state.isEditMode,
    );
    if (state.isAdvancedColorExpanded) {
      toggleAdvancedColor();
    }
  }

  void startEditMode() {
    state = state.copyWith(
      isEditMode: true,
    );
  }

  void toggleAdvancedColor() {
    state = state.copyWith(
      isAdvancedColorExpanded: !state.isAdvancedColorExpanded,
    );
  }
}
