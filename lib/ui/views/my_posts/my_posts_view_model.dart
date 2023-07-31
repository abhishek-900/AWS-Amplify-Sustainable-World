import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Product.dart';

import '../../../providers/current_user_provider.dart';

var myPostViewModelProvider = ChangeNotifierProvider((ref) {
  var uid = ref.watch(currentUserProvider).currentUser?.id;
  return MyPostViewModel(uid);
});

class MyPostViewModel with ChangeNotifier {
  bool isLoading = false;
  final String? _uid;
  List<Product?> _myPosts = [];
  MyPostViewModel(this._uid) {
    fetchMyPost();
  }
  List<Product?> get myPosts => _myPosts;

  Future<void> fetchMyPost() async {
    try {
      final request = ModelQueries.list(
        Product.classType,
        where: Product.USERDETAILID.eq(_uid),
      );
      final response = await Amplify.API.query(request: request).response;
      final products = response.data?.items;
      log(products.toString());
      if (products == null) {
        safePrint('errors: ${response.errors}');
        _myPosts = [];
      } else {
        _myPosts = products;
      }
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      _myPosts = [];
      notifyListeners();
    }
  }

  void deleteMyPost(int prodId) async {}
}
