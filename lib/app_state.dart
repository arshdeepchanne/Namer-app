import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>{};
  var historyList = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    historyList.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState;
    animatedList.insertItem(
      0,
      duration: Duration(milliseconds: 600),
    );
    var lastItem = historyList.last;
    if (historyList.length > 5) {
      animatedList.removeItem(
        historyList.length - 1,
        duration: Duration(milliseconds: 1000),
        (context, animation) {
          return FadeTransition(
            opacity: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: SizedBox(),
                label: Text(
                  lastItem.asPascalCase,
                ),
              ),
            ),
          );
        },
      );
      historyList.removeAt(historyList.length - 1);
    }
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorites(pair) {
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
