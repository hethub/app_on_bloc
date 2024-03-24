import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/app/app.dart';
import 'package:local_storage/app/auth/persentation/pages/auth.dart';
import 'package:local_storage/app/booked/persentation/pages/booked.dart';
import 'package:local_storage/app/history/persentation/pages/history.dart';
import 'package:local_storage/app/movies/persentation/pages/movies.dart';
import 'package:local_storage/config/routes/paths.dart';

import '../../main.dart';

typedef AR = AppRoutes;

abstract class AppRoutes {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final moviesNavigatorKey = GlobalKey<NavigatorState>();
  static final bookedShellNavigatorKey = GlobalKey<NavigatorState>();
  static final historyShellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PTH.initial,
    routes: routes,
    redirect: (context, state) async {
      /// TODO : Write login validation Logic
      const isLogdIn = true;
      if (isLogdIn) {
        return PTH.movies;
      }

      return PTH.signIn;
    },
    debugLogDiagnostics: true,
  );

  static final routes = <RouteBase>[
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: PTH.signIn,
      name: PTH.signIn,
      builder: (context, state) => const Auth(),
    ),
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return MovieAppShell(navigationShell: navigationShell);
        // return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        // Movies
        StatefulShellBranch(
          navigatorKey: moviesNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // parentNavigatorKey: moviesNavigatorKey,
              path: PTH.movies,
              name: PTH.movies,
              builder: (BuildContext context, GoRouterState state) =>
                  const Movies(),
              // routes: <RouteBase>[
              //   GoRoute(
              //     parentNavigatorKey: moviesNavigatorKey,
              //     path: CreateLeadScreen.shellRoute,
              //     name: CreateLeadScreen.shellRoute,
              //     builder: (BuildContext context, GoRouterState state) =>
              //         ChangeNotifierProvider(
              //       create: (_) => CreateLeadController(),
              //       builder: (context, child) => const CreateLeadScreen(),
              //     ),
              //   ),
              // ],
            ),
          ],
        ),
        // Booked
        StatefulShellBranch(
          navigatorKey: bookedShellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
                // parentNavigatorKey: bookedShellNavigatorKey,
                path: PTH.booked,
                name: PTH.booked,
                builder: (BuildContext context, GoRouterState state) =>
                    const Booked()),
          ],
        ),
        // History
        StatefulShellBranch(
          navigatorKey: historyShellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
                // parentNavigatorKey: historyShellNavigatorKey,
                path: PTH.history,
                name: PTH.history,
                builder: (BuildContext context, GoRouterState state) =>
                    const History()),
          ],
        ),
      ],
    ),
  ];
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
