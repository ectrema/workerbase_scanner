import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:workerbase_scanner/core/enums/router.enum.dart';
import 'package:workerbase_scanner/ui/screens/main/history/history.screen.dart';
import 'package:workerbase_scanner/ui/screens/main/home/home.screen.dart';
import 'package:workerbase_scanner/ui/screens/main/main.screen.dart';
import 'package:workerbase_scanner/ui/screens/scan_detail/scan_detail.screen.dart';

export 'package:workerbase_scanner/core/enums/router.enum.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

// GoRouter configuration
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterEnum.home.navigation,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          MainScreen(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterEnum.home.navigation,
              builder: (_, GoRouterState state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouterEnum.history.navigation,
              builder: (_, GoRouterState state) => const HistoryScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RouterEnum.scanDetail.navigation,
      builder: (_, GoRouterState state) => ScanDetailScreen(
        qrCode: state.extra as String,
      ),
    ),
  ],
);
