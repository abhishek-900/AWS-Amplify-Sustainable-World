import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Order.dart';
import 'package:sustainable_world/models/Product.dart';

import '../../../providers/current_user_provider.dart';

var productDetailsViewModelProvider = ChangeNotifierProvider((ref) {
  var uid = ref.read(currentUserProvider).currentUser!.id;
  return ProductDetailsViewModel(uid);
});

class ProductDetailsViewModel with ChangeNotifier {
  final PageController pageController;
  String? uid;

  ProductDetailsViewModel(this.uid) : pageController = PageController();

  Future<void> createPost({required Product product}) async {
    /// before creating post store image to S3

    try {
      final request = ModelMutations.create(product);
      final response = await Amplify.API.mutate(request: request).response;
      final createdPost = response.data;
      if (createdPost == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${product.title}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> createOrder({required Product product}) async {
    Order order = Order(
      userdetailID: uid!,
      product: product,
    );
    try {
      final request = ModelMutations.create(order);
      final response = await Amplify.API.mutate(request: request).response;
      final createdOrder = response.data;
      if (createdOrder == null) {
        safePrint('error: ${response.errors}');
        return;
      }
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
