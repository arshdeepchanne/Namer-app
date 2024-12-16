import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(
        child: Text("No favorites yet."),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "You have ${favorites.length} favorites",
            style: theme.textTheme.displaySmall!,
          ),
        ),
        for (var fav in favorites)
          ListTile(
            leading: IconButton(
              onPressed: () {
                appState.removeFavorite(fav);
              },
              icon: Icon(
                Icons.delete_outline_rounded,
              ),
            ),
            title: Text(fav.asPascalCase),
          )
      ],
    );
  }
}
