import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

typedef CategoriesSetter = Set<String> Function(Set<String> old);
var shopFilterViewModelProvider =
    ChangeNotifierProvider((ref) => ShopFilterViewModel());

class ShopFilterViewModel with ChangeNotifier {
  bool _categoriesExpanded;
  bool _priceExpanded;
  bool _locationExpanded;
  Set<String> _selectedCategories;
  bool _priceFree;
  RangeValues _priceRange;
  double _distance;

  ShopFilterViewModel()
      : _categoriesExpanded = false,
        _priceExpanded = false,
        _locationExpanded = false,
        _selectedCategories = {},
        _priceFree = false,
        _priceRange = const RangeValues(0, 10000),
        _distance = 100;

  bool get categoriesExpanded => _categoriesExpanded;
  bool get priceExpanded => _priceExpanded;
  bool get locationExpanded => _locationExpanded;
  Set<String> get selectedCategories => _selectedCategories;
  bool get priceFree => _priceFree;
  RangeValues get priceRange => _priceRange;

  String _formatPrice(double price) {
    if (price == 0) return "Free";
    if (price == 10000) return "Rs. 10,000+";
    return NumberFormat.currency(
            locale: "en_IN", decimalDigits: 0, symbol: "Rs. ")
        .format(price);
  }

  RangeLabels get priceRangeLabels => RangeLabels(
      _formatPrice(_priceRange.start), _formatPrice(_priceRange.end));

  double get distance => _distance;

  String get distanceLabel {
    if (_distance == 100) return "100 kms+";

    return "Upto ${_distance.toInt()} Kms";
  }

  set categoriesExpanded(bool value) {
    _categoriesExpanded = value;
    notifyListeners();
  }

  set priceExpanded(bool value) {
    _priceExpanded = value;
    notifyListeners();
  }

  set locationExpanded(bool value) {
    _locationExpanded = value;
    notifyListeners();
  }

  set priceFree(bool value) {
    _priceFree = value;
    notifyListeners();
  }

  set priceRange(RangeValues rangeValues) {
    _priceRange = rangeValues;
    notifyListeners();
  }

  void setSelectedCategories(CategoriesSetter update) {
    _selectedCategories = update(_selectedCategories);
    notifyListeners();
  }

  set distance(double value) {
    _distance = value;
    notifyListeners();
  }
}
