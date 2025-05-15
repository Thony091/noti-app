
import 'package:go_router/go_router.dart';

import '../../features/news/presentation/container.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (_, __) => const HomePage(),
          ),
          GoRoute(
            path: '/favorite',
            builder: (_, __) => const FavoritePage(),
          ),
        ],
      ),
    ],
  );
}