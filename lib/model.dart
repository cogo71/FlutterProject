import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class ToBuyItem extends ChangeNotifier {
  ToBuyItem(this.text, this.bought, this.selected);

  String text;
  bool bought;
  bool selected;

  void setText(String s) {
    text = s;
    notifyListeners();
  }

  void toggle() {
    bought = !bought;
    notifyListeners();
  }

  void setSelected() {
    selected = !selected;
    notifyListeners();
  }
}

class ToBuyList extends ChangeNotifier {
  List<ToBuyItem> _tobuy = []; //l'underscore rende il vettore privato al file

  UnmodifiableListView<ToBuyItem> get tobuy => UnmodifiableListView(_tobuy);
  //UnmodifiableListView ci permette di restituire un array di elemnti non modificabile esternamente
  int get totalCount => _tobuy.length;

  void Add(String text) {
    _tobuy.add(ToBuyItem(text, false, false));

    notifyListeners();
  }

  void Delete(int indice) {
    //_tobuy.removeWhere((item) => _tobuy.indexOf('item') == indice);
    //_tobuy.remove(indice);
    _tobuy.removeAt(indice);

    notifyListeners();
  }

  void dismissAll() {
    _tobuy.clear();

    notifyListeners();
  }

  void activate(int index) {
    _tobuy[index].bought = !_tobuy[index].bought;

    notifyListeners();
  }
}
