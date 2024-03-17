/// A state class representing the state of the edit mode
/// It holds the state of the edit mode and the advanced color picker
// will later have to hold a uuid or id to identify which flashlist is being edited
class EditModeState {
  const EditModeState({
    this.isEditMode = false,
    this.isAdvancedColorExpanded = false,
  });

  final bool isEditMode;
  final bool isAdvancedColorExpanded;

  EditModeState copyWith({
    bool? isEditMode,
    bool? isAdvancedColorExpanded,
  }) {
    return EditModeState(
      isEditMode: isEditMode ?? this.isEditMode,
      isAdvancedColorExpanded:
          isAdvancedColorExpanded ?? this.isAdvancedColorExpanded,
    );
  }
}
