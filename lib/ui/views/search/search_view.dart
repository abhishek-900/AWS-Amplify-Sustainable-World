import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Product.dart';

import 'package:sustainable_world/ui/modular/location_tag.dart';
import 'package:sustainable_world/ui/views/product_details/product_details_view.dart';
import 'package:sustainable_world/ui/views/search/search_view_model.dart';

class SearchView extends HookConsumerWidget {
  static const String routeName = "/search";
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchController = useTextEditingController();
    var searchedItems = useState<List<Product?>>([]);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: TextField(
              controller: searchController,
              autofocus: true,
              decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                hintText: "Search anything",
              ),
              onChanged: (query) {
                searchedItems.value = [];
                searchedItems.value =
                    ref.read(searchViewModelProvider).items.where((element) {
                  return element!.title!
                      .toLowerCase()
                      .contains(query.toLowerCase());
                }).toList();
              },
            ),
            actions: [
              if (searchController.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    searchController.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
              IconButton(
                onPressed: searchController.text.isNotEmpty
                    ? () {
                        Navigator.of(context).pop();
                      }
                    : null,
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          if (searchController.text.isNotEmpty && searchedItems.value.isEmpty)
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(Icons.search_off, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    "No results found!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final products = searchedItems.value;
                return ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ProductDetailsView.routeName, arguments: {
                      'product': products[index],
                    });
                  },
                  leading: SizedBox(
                    width: 80,
                    child: CachedNetworkImage(
                      imageUrl: products[index]!.producImages![0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  isThreeLine: true,
                  title: Text(products[index]!.title!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(products[index]!.title ?? ""),
                      const SizedBox(height: 4),
                      LocationTag.small(products[index]!.productLocation ?? ""),
                    ],
                  ),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
              childCount: searchedItems.value.length,
            ),
          ),
        ],
      ),
    );
  }
}
