/// A state class representing the state of the edit mode
/// It holds the state of the edit mode and the advanced color picker
// will later have to hold a uuid or id to identify which flashlist is being edited
class EditModePanelState {
  const EditModePanelState({
    this.isEditMode = false,
    this.isAdvancedColorExpanded = false,
    this.flashlistInEditMode = 0,
  });

  final bool isEditMode;
  final bool isAdvancedColorExpanded;
  final int flashlistInEditMode;

  EditModePanelState copyWith({
    bool? isEditMode,
    bool? isAdvancedColorExpanded,
    int? flashlistInEditMode,
  }) {
    return EditModePanelState(
      isEditMode: isEditMode ?? this.isEditMode,
      isAdvancedColorExpanded:
          isAdvancedColorExpanded ?? this.isAdvancedColorExpanded,
      flashlistInEditMode: flashlistInEditMode ?? this.flashlistInEditMode,
    );
  }
}
