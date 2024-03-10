import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that automates the [loading] and [error] state of an [AsyncValue].
/// This way it's only necessary to provide the [data] state.
/// Intended to be used with [AsyncValue] from the `hooks_riverpod` package.

/// Usage:
/// ```dart
/// final AsyncValueWidget(value: ref.watch(myProvider), data: (data) => Text(data));
/// ```
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});
  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}
