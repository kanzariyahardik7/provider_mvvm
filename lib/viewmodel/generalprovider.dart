import 'package:flutter/material.dart';

class GeneralProivider extends ChangeNotifier {
  int _itemCountHome = 0;
  get itemCountHome => _itemCountHome;
  int _itemCountProfile = 0;
  get itemCountProfile => _itemCountProfile;

  incrementItem(type) {
    if (type == "home") {
      _itemCountHome++;
    } else {
      _itemCountProfile++;
    }

    notifyListeners();
  }
}
