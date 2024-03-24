import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/app/app.dart';
import 'package:local_storage/app/booked/persentation/pages/booked.dart';
import 'package:local_storage/app/details/persentation/pages/details.dart';
import 'package:local_storage/app/history/persentation/pages/history.dart';
import 'package:local_storage/app/movies/persentation/pages/movies.dart';
import 'package:local_storage/app/search/persentation/pages/search.dart';
import 'package:local_storage/config/routes/paths.dart';
import 'package:local_storage/splash_screen.dart';
import '../../app/auth/persentation/pages/sign_in_page.dart';
import '../../app/auth/persentation/pages/sing_up_page.dart';
import '../../app/book_ticket/persentation/pages/book_ticket.dart';

typedef AR = AppRoutes;

abstract class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorMovieKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorBookedKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHistoryKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      /// Initial Path
      GoRoute(
        path: PTH.initial,
        name: PTH.initial,
        // redirect: (context, state) async {
        //   final user = await sl.get<GetUser>().call();
        //   await Future.delayed(Duration(seconds: 5));
        //   if (user.isSignIN!) {
        //     return PTH.movies;
        //   }
        //   return PTH.signIn;
        // },
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SplashScreen()),
      ),
      GoRoute(
        path: PTH.signIn,
        name: PTH.signIn,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignInPage()),
      ),

      GoRoute(
        path: PTH.signUp,
        name: PTH.signUp,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignUpPage()),
      ),

      GoRoute(
        path: PTH.search,
        name: PTH.search,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: Search()),
      ),
      GoRoute(
        path: PTH.bookTicket,
        name: PTH.bookTicket,
        pageBuilder: (context, state) {
          final extra =
              state.extra! as ({int movieId, String title, String url});
          return NoTransitionPage(
            child: BookTicket(
              title: extra.title,
              movieId: extra.movieId,
              url: extra.url,
            ),
          );
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MovieAppShell(navigationShell: navigationShell);
        },
        branches: [
          // Movie Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMovieKey,
            routes: [
              GoRoute(
                path: PTH.movies,
                name: PTH.movies,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Movies(),
                ),
                routes: [
                  GoRoute(
                    path: '${PTH.detail}/:movieId',
                    name: PTH.detail,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: Details(
                          movieId: state.pathParameters['movieId']!,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          // Booked Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBookedKey,
            routes: [
              GoRoute(
                path: PTH.booked,
                name: PTH.booked,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: Booked(),
                  );
                },
              ),
            ],
          ),
          // History Branch
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHistoryKey,
            routes: [
              GoRoute(
                path: PTH.history,
                name: PTH.history,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: History(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
