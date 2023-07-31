import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart' hide Visibility;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

import '../../../providers/current_user_provider.dart';

var disposeCategoriesProvider = FutureProvider((ref) {
  var uid = ref.read(currentUserProvider).currentUser!.id;
  return DisposeFormProvider(uid).fetchCategories();
});

var disposeFormProvider = ChangeNotifierProvider(
  (ref) {
    var uid = ref.read(currentUserProvider).currentUser!.id;
    return DisposeFormProvider(uid);
  },
);

typedef DisposeFormDataCallback = Map<String, dynamic> Function(
  Map<String, dynamic> oldData,
);

class DisposeFormProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;
  String? uid;

  DisposeFormProvider(this.uid);

  void setData(DisposeFormDataCallback update) {
    _data = update(_data);
    notifyListeners();
    log(_data.toString());
  }

  void addProduct(Product product) {}

  Product? getPreviewProduct() {
    return Product(
      title: _data['title'],
      description: _data['description'],
      contributionType: _data['contributionType'] as ContributionType,
      amount: _data['amount'],
      visibility: _data['visibility'] as Visibility,
      status: ProductStatus.ACTIVE,
      weight: _data['weight'],
      productLocation: _data['productLocation'],
      producImages: _data['producImages'],
      productTags: _data['productTags'] ?? [],
      userdetailID: uid!,
      productcategoryID: _data['productcategoryID'],
      userdetails: _data["selectiveRecyclers"],
    );
  }

  Future<List<ProductCategory?>> fetchCategories() async {
    try {
      final request = ModelQueries.list(ProductCategory.classType);
      final response = await Amplify.API.query(request: request).response;
      final categories = response.data?.items;
      if (categories == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return categories;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }
}
