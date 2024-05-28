import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

MediaQueryData mediaQueryOf(context) {
  return MediaQuery.of(context);
}

extension ShowSnackBar on BuildContext {
  void showContextSnackBar(context,
      {required String message, SnackBarAction? action, Duration? duration}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 5),
        action: action,
        backgroundColor: colorSchemeOf(context).primary,
        content: Text(message),
      ),
    );
  }
}

extension Localizations on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
