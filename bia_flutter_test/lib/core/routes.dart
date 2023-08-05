part of com.bia_flutter_test.core.core;

class Routes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: ListScreen.route,
        builder: (context, state) => const ListScreen(),
        routes: <RouteBase>[],
      ),
    ],
  );
}
