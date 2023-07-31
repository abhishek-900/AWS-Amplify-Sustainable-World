import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart' hide Visibility;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

var shopViewModelProvider = FutureProvider((ref) {
  return YourOffersViewModel().fetchShopProduct();
});

class YourOffersViewModel with ChangeNotifier {
  YourOffersViewModel();

  Future<List<Product?>> fetchShopProduct() async {
    try {
      final request = ModelQueries.list(
        Product.classType,
        where: Product.VISIBILITY.eq(Visibility.PUBLIC).and(
              Product.STATUS.eq(ProductStatus.ACTIVE),
            ),
      );
      final response = await Amplify.API.query(request: request).response;
      final products = response.data?.items;
      if (products == null) {
        safePrint('errors: ${response.errors}');
        return [];
      }
      return products;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }
}
