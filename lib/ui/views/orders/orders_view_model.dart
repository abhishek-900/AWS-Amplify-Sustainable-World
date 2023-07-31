import 'dart:convert';
import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/main.dart';

import '../../../models/ModelProvider.dart';
import '../../../providers/current_user_provider.dart';

var ordersViewModelProvider = FutureProvider.autoDispose((ref) {
  var uid = ref.read(currentUserProvider).currentUser!.id;

  if (mRole == UserType.DISPOSER) {
    return OrderViewModel().disposerOrder(uid);
  } else {
    return OrderViewModel().recyclerOrder(uid);
  }
});

class OrderViewModel extends ChangeNotifier {
  Product? product;

  Future<List<Map<String, dynamic>>> disposerOrder(String uid) async {
    try {
      return getOrdersWithProductIds(uid);
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }

  Future<List<String?>> productIdsByUserId(String uid) async {
    try {
      final request = ModelQueries.list(
        Product.classType,
        where: Product.USERDETAILID.eq(uid),
      );

      final response = await Amplify.API.query(request: request).response;
      final products = response.data?.items;
      if (products == null) {
        safePrint('errors: ${response.errors}');
        return [];
      }
      return products.map((e) => e?.id).toList();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getOrdersWithProductIds(String uid) async {
    try {
      List<Map<String, dynamic>> output = [];
      var productIds = await productIdsByUserId(uid);

      final operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: '''
                  query MyQuery {
          listOrders {
            items {
              product {
                id
                producImages
                amount
                title
              }
              transactionId
              id
            }
          }
        }
        ''',
        ),
      );

      var response = await operation.response;
      var data = jsonDecode(response.data!)['listOrders']['items'] as List;
      log("ABHISHEK$data");
      for (var order in data) {
        Map<String, dynamic> _map = {};
        if (productIds.contains(order['product']['id'])) {
          _map['id'] = order['id'];
          _map['transactionId'] = order['transactionId'];
          _map['product'] = order['product'];
          output.add(_map);
        }
      }

      return output;
    } catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }

  Future<Product?> getProductById(String? orderProductId) async {
    try {
      final request = ModelQueries.list(Product.classType,
          where: Product.ID.eq(orderProductId));
      final response = await Amplify.API.query(request: request).response;
      final _product = response.data?.items;

      if (_product == null) {
        safePrint('errors: ${response.errors}');
        return null;
      }
      return _product.first;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> recyclerOrder(String uid) async {
    List<Map<String, dynamic>> output = [];

    try {
      final operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: '''
           query MyQuery {
            listOrders(filter: {userdetailID: {eq: "$uid"}}) {
              items {
                product {
                  id
                  title
                  amount
                  producImages
                }
                id
                transactionId
              }
            }
          } ''',
          variables: {
            'uid': uid,
          },
        ),
      );

      var response = await operation.response;
      var data = jsonDecode(response.data!)['listOrders']['items'] as List;
      for (var order in data) {
        Map<String, dynamic> _map = {};
        _map['id'] = order['id'];
        _map['transactionId'] = order['transactionId'];
        _map['product'] = order['product'];
        output.add(_map);
      }

      return output;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return [];
    }
  }
}
