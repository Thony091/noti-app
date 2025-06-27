
import 'package:go_router/go_router.dart';

import '../../features/news/presentation/container.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (_, __) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorite',
                builder: (_, __) => const FavoritePage(),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
