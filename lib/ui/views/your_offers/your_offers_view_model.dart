import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Product.dart';
import 'package:sustainable_world/models/ProductStatus.dart';
import 'package:sustainable_world/models/Visibility.dart';
import 'package:sustainable_world/providers/current_user_provider.dart';

var offersViewModelProvider = FutureProvider((ref) {
  var uid = ref.read(currentUserProvider).currentUser!.id;
  return YourOffersViewModel().exclusiveForYou(uid);
});

class YourOffersViewModel {
  YourOffersViewModel();

  Future<List<Product?>> exclusiveForYou(String uid) async {
    try {
      final request = ModelQueries.list(Product.classType,
          where: Product.VISIBILITY
              .eq(Visibility.SELECTIVE)
              .and(Product.STATUS.eq(ProductStatus.ACTIVE))
          // .and(Product.USERDETAILS.contains(uid)),
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
