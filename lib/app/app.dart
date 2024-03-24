import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppStatus {
  loading,
  authenticate,
  unAuthenticate;
}

class MovieAppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MovieAppShell({super.key, required this.navigationShell});

  void _goBranch(
    int index,
  ) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
            left: kBottomNavigationBarHeight,
            right: kBottomNavigationBarHeight,
            bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            height: kBottomNavigationBarHeight + 8,
            animationDuration: Durations.long2,
            onDestinationSelected: (int idx) => _goBranch(idx),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            overlayColor: MaterialStatePropertyAll(Colors.amber.shade100),
            shadowColor: Colors.grey,
            indicatorColor: Colors.amber.shade500,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.movie),
                icon: Icon(Icons.movie_outlined),
                label: 'Movies',
              ),
              NavigationDestination(
                icon: Icon(Icons.save),
                selectedIcon: Icon(Icons.save_outlined),
                label: 'Booked',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.history),
                icon: Icon(Icons.history_outlined),
                label: 'History',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
