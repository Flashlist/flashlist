import 'package:flashlist_flutter/src/features/home/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
