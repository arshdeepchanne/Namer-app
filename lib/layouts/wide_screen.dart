import 'package:flutter/material.dart';

class WideScreen extends StatelessWidget {
  final int selectedIndex;
  final Widget currentPage;
  final ValueChanged<int> onPageSelected;
  final bool isWide;

  const WideScreen({
    super.key,
    required this.selectedIndex,
    required this.currentPage,
    required this.onPageSelected,
    required this.isWide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SafeArea(
          child: NavigationRail(
            extended: isWide,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              )
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: onPageSelected,
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: currentPage,
          ),
        )
      ],
    );
  }
}
