import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/utils/context_helper.dart';

/// A widget that automates the [loading] and [error] state of an [AsyncValue].
/// This way it's only necessary to provide the [data] state.
/// Intended to be used with [AsyncValue] from the `hooks_riverpod` package.
/// When [withLoadingIndicator] is set to `false`, no loading indicator will be shown.

/// Usage:
/// ```dart
/// final AsyncValueWidget(value: ref.watch(myProvider), data: (data) => Text(data));
/// ```
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.withLoadingIndicator = true,
    this.onReloadPress,
  });
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final bool withLoadingIndicator;
  final void Function()? onReloadPress;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => withLoadingIndicator
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox(),
      error: (e, st) => onReloadPress != null
          ? Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // const Icon(Icons.hourglass_disabled, color: Colors.red, size: 50),
                    ElevatedButton(
                      onPressed: onReloadPress,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh),
                          gapW12,
                          Text('Refresh'),
                        ],
                      ),
                    ),
                    gapH16,
                    Text(
                      'We couldn\'t load this data. Please refresh.',
                      style: TextStyle(
                        color: colorSchemeOf(context).onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
