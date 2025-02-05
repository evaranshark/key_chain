import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellPage extends StatelessWidget {
  const ShellPage({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return switch (constraints.maxWidth) {
        <= 450 => _NavigationBarShell(navigationShell: navigationShell),
        _ => _NavigationRailShell(
            navigationShell: navigationShell,
          ),
      };
    });
  }
}

class _NavigationBarShell extends StatelessWidget {
  const _NavigationBarShell({
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.password_rounded,
            ),
            label: 'Generator',
          ),
          NavigationDestination(
            icon: Icon(Icons.key),
            label: 'Storage',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.credit_card_rounded,
            ),
            label: 'Cards',
          ),
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => _onTap(context, index),
      ),
      body: navigationShell,
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class _NavigationRailShell extends StatelessWidget {
  const _NavigationRailShell({
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Row(
          children: [
            NavigationRail(
              elevation: 10,
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(
                    Icons.password_rounded,
                  ),
                  label: Text('Generator'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.key),
                  label: Text('Storage'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.credit_card_rounded,
                  ),
                  label: Text('Cards'),
                ),
              ],
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => _onTap(context, index),
            ),
            VerticalDivider(
              width: 1.0,
            ),
            Expanded(
              child: navigationShell,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
