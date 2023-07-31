import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/models/ProductCategory.dart';
import 'package:sustainable_world/models/UserType.dart';

var homeStatisticsViewModelProvider = ChangeNotifierProvider(
  (ref) => HomeStatisticsViewModel(),
);

class HomeStatisticsViewModel with ChangeNotifier {
  final double _disposerSum = 126.3;
  final double _recyclerSum = 126.3;

  double get disposerSum => _disposerSum;
  double get recyclerSum => _recyclerSum;
  List<ProductCategory?> _productCategory = [];
  List<ProductCategory?> get productCategory => _productCategory;

  HomeStatisticsViewModel() {
    if (mRole == UserType.DISPOSER) {
      _fetchDisposerStatistics();
    }

    if (mRole == UserType.RECYCLER) {
      _fetchRecyclerStatistics();
    }
    fetchProductCategory();
  }

  Future<void> _fetchDisposerStatistics() async {}

  Future<void> _fetchRecyclerStatistics() async {}

  Future<void> fetchProductCategory() async {
    try {
      final request = ModelQueries.list(ProductCategory.classType);
      final response = await Amplify.API.query(request: request).response;

      final category = response.data?.items;
      if (category == null) {
        safePrint('errors: ${response.errors}');
        _productCategory = [];
      } else {
        _productCategory = category;
      }
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      _productCategory = [];
      notifyListeners();
    }
  }
}
