import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _discountFilter =
          prefs.getStringList('ff_discountFilter')?.map(int.parse).toList() ??
              _discountFilter;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<int> _discountFilter = [];
  List<int> get discountFilter => _discountFilter;
  set discountFilter(List<int> value) {
    _discountFilter = value;
    prefs.setStringList(
        'ff_discountFilter', value.map((x) => x.toString()).toList());
  }

  void addToDiscountFilter(int value) {
    _discountFilter.add(value);
    prefs.setStringList(
        'ff_discountFilter', _discountFilter.map((x) => x.toString()).toList());
  }

  void removeFromDiscountFilter(int value) {
    _discountFilter.remove(value);
    prefs.setStringList(
        'ff_discountFilter', _discountFilter.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromDiscountFilter(int index) {
    _discountFilter.removeAt(index);
    prefs.setStringList(
        'ff_discountFilter', _discountFilter.map((x) => x.toString()).toList());
  }

  void updateDiscountFilterAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _discountFilter[index] = updateFn(_discountFilter[index]);
    prefs.setStringList(
        'ff_discountFilter', _discountFilter.map((x) => x.toString()).toList());
  }

  void insertAtIndexInDiscountFilter(int index, int value) {
    _discountFilter.insert(index, value);
    prefs.setStringList(
        'ff_discountFilter', _discountFilter.map((x) => x.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
