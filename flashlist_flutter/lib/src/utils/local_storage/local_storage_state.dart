class LocalStorageState {
  final List<String> recentColors;
  // final Map<int, bool> listCollapseStates;

  LocalStorageState({
    required this.recentColors,
    // required this.listCollapseStates,
  });

  LocalStorageState copyWith({
    List<String>? recentColors,
    // Map<int, bool>? listCollapseStates,
  }) {
    return LocalStorageState(
      recentColors: recentColors ?? this.recentColors,
      // listCollapseStates: listCollapseStates ?? this.listCollapseStates,
    );
  }
}
