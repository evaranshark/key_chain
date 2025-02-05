import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:key_chain/presentation/pages/home/home_page.dart';
import 'package:key_chain/presentation/pages/shell/shell_page.dart';

final class RouterProvider {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _generatorNavigatorKey = GlobalKey<NavigatorState>();
  final _storageNavigatorKey = GlobalKey<NavigatorState>();
  final _cardsNavigatorKey = GlobalKey<NavigatorState>();

  late final RouterConfig<RouteMatchList> router;

  RouterProvider() {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => '/generator',
        ),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          branches: [
            StatefulShellBranch(
              navigatorKey: _generatorNavigatorKey,
              routes: [
                GoRoute(
                  path: '/generator',
                  name: 'generator',
                  // builder: (_, __) => const HomePage(),
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: HomePage()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _storageNavigatorKey,
              routes: [
                GoRoute(
                  path: '/storage',
                  name: 'storage',
                  // builder: (_, __) => const HomePage(),
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: HomePage()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _cardsNavigatorKey,
              routes: [
                GoRoute(
                  path: '/cards',
                  name: 'cards',
                  // builder: (_, __) => const HomePage(),
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: HomePage()),
                ),
              ],
            ),
          ],
          builder: (context, state, child) {
            return ShellPage(
              navigationShell: child,
            );
          },
        ),
      ],
    );
  }
}
