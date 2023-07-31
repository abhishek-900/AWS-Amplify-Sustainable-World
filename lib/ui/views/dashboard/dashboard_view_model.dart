import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Product.dart';

var productRecommendationProvider = FutureProvider((ref) async {
  try {
    final request = ModelQueries.list(Product.classType);

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
});
