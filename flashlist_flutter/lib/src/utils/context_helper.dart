import 'package:flutter/material.dart';

ThemeData themeOf(context) {
  return Theme.of(context);
}

TextTheme textThemeOf(context) {
  return themeOf(context).textTheme;
}

ColorScheme colorSchemeOf(context) {
  return themeOf(context).colorScheme;
}

Brightness brightnessOf(context) {
  return themeOf(context).brightness;
}

bool isDarkThemeOf(context) {
  return brightnessOf(context) == Brightness.dark;
}

void showContextSnackBar(
  context, {
  required String message,
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: action,
      backgroundColor: colorSchemeOf(context).primary,
      content: Text(message),
    ),
  );
}
