import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A Async List with Divider above the [title].
/// [value] is an [AsyncValue] that holds a list of [T] (generic type).
/// [itemBuilder] is a function that builds a widget for each item in the list.
///
/// Usage:
/// ```dart
/// final AsyncValueListWithTitle(
///   title: 'Connections',
///   value: ref.watch(connectionsProvider),
///   itemBuilder: (context, index) {
///     final connection = connections[index];
///     return UserAvatarRow(
///       username: connection!.username,
///     );
///   },
/// );
/// ```
class AsyncValueListWithTitle<T> extends StatelessWidget {
  const AsyncValueListWithTitle({
    super.key,
    required this.title,
    this.gap = 8.0,
    required this.value,
    required this.listItemBuilder,
  });
  final String? title;
  final double gap;
  final AsyncValue<List<T>> value;
  final Widget? Function(T itemData) listItemBuilder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (List<T> data) {
        // Empty State
        if (data.isEmpty) {
          return const SizedBox();
        }

        // List with Title
        return Column(
          children: [
            if (data.isNotEmpty) const Divider(),
            if (title != null)
              Row(
                children: [
                  Text(title!, style: const TextStyle(fontSize: Sizes.p16)),
                ],
              ),
            SizedBox(
              height: gap,
            ),
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: gap / 2),
                  child: listItemBuilder(item),
                );
              },
            ),
          ],
        );
      },
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
      loading: () => const SizedBox(),
    );
  }
}
