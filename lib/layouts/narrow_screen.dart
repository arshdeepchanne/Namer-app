import 'package:flutter/material.dart';

class NarrowScreen extends StatelessWidget {
  final int selectedIndex;
  final Widget currentPage;
  final ValueChanged<int> onPageSelected;

  const NarrowScreen({
    super.key,
    required this.selectedIndex,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: currentPage,
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SafeArea(
            child: NavigationBar(
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: "Favorites",
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: onPageSelected,
            ),
          ),
        ),
      ],
    );
  }
}
