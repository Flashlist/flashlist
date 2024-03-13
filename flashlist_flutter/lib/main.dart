import 'package:flashlist_flutter/src/features/routing/app_router.dart';
import 'package:flashlist_flutter/src/theme/app_theme_dark.dart';
import 'package:flashlist_flutter/src/theme/app_theme_light.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Flashlist',
        theme: theme,
        darkTheme: darkTheme,
        routerConfig: goRouter,
      ),
    );
  }
}
