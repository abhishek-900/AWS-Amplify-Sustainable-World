import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sustainable_world/ui/views/search/search_view.dart';
import 'package:sustainable_world/ui/views/shop/shop_view_model.dart';

import '../../modular/product_card.dart';
import '../product_details/product_details_view.dart';

class ShopView extends ConsumerWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.filter,
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ref.watch(shopViewModelProvider).when(
            data: (products) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                padding: const EdgeInsets.only(bottom: 80),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      await Navigator.of(context).pushNamed(
                        ProductDetailsView.routeName,
                        arguments: {
                          'product': products[index],
                        },
                      );
                    },
                    child: ProductCard(
                      product: products[index]!,
                    ),
                  );
                },
                itemCount: products.length,
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
