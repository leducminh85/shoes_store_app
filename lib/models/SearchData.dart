import 'package:flutter/material.dart';

class SearchMode extends ChangeNotifier {
  String _searchText = '';
  bool isFocused = false;

  String get searchText => _searchText;

  void setSearchText(String newText) {
    _searchText = newText;
    notifyListeners();
  }

  void onSearchChangeFocus(bool state) {
    isFocused = state;
    notifyListeners();
  }
}

SearchMode searchMode = SearchMode();
