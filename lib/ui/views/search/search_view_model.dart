import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/Product.dart';

var searchViewModelProvider =
    ChangeNotifierProvider<SearchViewModel>((ref) => SearchViewModel());

class SearchViewModel with ChangeNotifier {
  bool isLoading = false;
  SearchViewModel() {
    fetchShopProduct("");
  }
  List<Product?> items = [];
  Future<void> fetchShopProduct(String uid) async {
    try {
      isLoading = true;
      notifyListeners();
      final request = ModelQueries.list(Product.classType);
      final response = await Amplify.API.query(request: request).response;
      isLoading = false;
      notifyListeners();
      final products = response.data?.items;
      if (products == null) {
        safePrint('errors: ${response.errors}');
        items = [];
      } else {
        items = products;
      }
    } on ApiException catch (e) {
      isLoading = false;
      notifyListeners();
      safePrint('Query failed: $e');
      items = [];
    }
  }
}
