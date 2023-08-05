part of 'core.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: ListScreen.route,
        builder: (final BuildContext context, final GoRouterState state) =>
            const ListScreen(),
        routes: <RouteBase>[
          GoRoute(
            name: DetailScreen.route,
            path: DetailScreen.route,
            builder: (final BuildContext context, final GoRouterState state) =>
                DetailScreen(
              result: state.extra as Result,
            ),
          ),
        ],
      ),
    ],
  );
}
