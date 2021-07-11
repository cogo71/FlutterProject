import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class ToBuyItem extends ChangeNotifier {
  ToBuyItem(this.text, this.bought);

  String text;
  bool bought;

  void setText(String s) {
    text = s;
    notifyListeners();
  }

  void toggle() {
    bought = !bought;
    notifyListeners();
  }
}

class ToBuyList extends ChangeNotifier {
  List<ToBuyItem> _tobuy = []; //l'underscore rende il vettore privato al file

  UnmodifiableListView<ToBuyItem> get tobuy => UnmodifiableListView(_tobuy);
  int get totalCount => _tobuy.length;

  void Add(String text) {
    _tobuy.add(ToBuyItem(text, false));

    notifyListeners();
  }

  void Delete(int indice) {
    _tobuy.removeAt(indice);

    notifyListeners();
  }

  void dismissAll() {
    _tobuy.clear();

    notifyListeners();
  }
}
