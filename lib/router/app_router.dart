import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tab_bar_go_router/screens/counter.dart';
import 'package:tab_bar_go_router/screens/detail.dart';
import 'package:tab_bar_go_router/screens/profile.dart';
import 'package:tab_bar_go_router/screens/section_a.dart';
import 'package:tab_bar_go_router/screens/section_b.dart';
import 'package:tab_bar_go_router/screens/wrappers/scaffold_with_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  routes: <RouteBase>[

    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) => const Profile(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: '/a',
                builder: (BuildContext context, GoRouterState state) =>
                    const SectionA(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'detail',
                    builder: (BuildContext context, GoRouterState state) =>
                        const Detail(),
                  ),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/b',
              builder: (BuildContext context, GoRouterState state) =>
                  const SectionB(),
            ),
            GoRoute(
              path: '/counter',
              builder: (BuildContext context, GoRouterState state) => Counter(),
            ),
          ],
        ),
      ],
    ),
  ],
);
