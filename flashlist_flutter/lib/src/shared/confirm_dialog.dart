import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const kDialogDefaultKey = Key('dialog-default-key');

/// Generic function to show an alert dialog
/// Platform aware (iOS and Android)
/// Material / Cupertino
Future<bool?> showConfirmDialog({
  required BuildContext context,
  required String title,
  String? content,
  dynamic cancelAction,
  dynamic confirmAction,
}) async {
  Widget buildAction(dynamic action) {
    if (action is String) {
      return TextButton(
        onPressed: () => context.pop(action == confirmAction),
        child: Text(action),
      );
    } else if (action is IconData) {
      return IconButton(
        onPressed: () => context.pop(action == confirmAction),
        icon: Icon(action),
      );
    } else {
      throw ArgumentError('Invalid action type: $action');
    }
  }

  return showDialog(
    context: context,
    barrierDismissible: cancelAction != null,
    builder: (BuildContext context) => AlertDialog.adaptive(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: kIsWeb || !Platform.isIOS
          ? <Widget>[
              if (cancelAction != null) buildAction(cancelAction),
              buildAction(confirmAction),
            ]
          : <Widget>[
              if (cancelAction != null)
                CupertinoDialogAction(
                  child: buildAction(cancelAction),
                ),
              CupertinoDialogAction(
                key: kDialogDefaultKey,
                child: buildAction(confirmAction),
              ),
            ],
    ),
  );
}
