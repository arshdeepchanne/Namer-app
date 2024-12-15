import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:provider/provider.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    return AnimatedList(
      key: _key,
      reverse: true,
      initialItemCount: appState.historyList.length,
      itemBuilder: (context, index, animation) {
        final pair = appState.historyList[index];
        return FadeTransition(
          opacity: animation,
          child: Center(
            child: TextButton.icon(
              onPressed: () {
                appState.toggleFavorites(pair);
              },
              icon: appState.favorites.contains(pair)
                  ? Icon(Icons.favorite)
                  : SizedBox(),
              label: Text(pair.asPascalCase),
            ),
          ),
        );
      },
    );
  }
}
