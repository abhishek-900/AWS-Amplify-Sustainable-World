import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_world/models/Product.dart';
import 'package:sustainable_world/ui/modular/tag_chip.dart';
import 'package:sustainable_world/utils/error_image.dart';
import 'package:sustainable_world/utils/utils_functions.dart';
import '../product_details/product_details_view.dart';

class OffersCard extends StatelessWidget {
  final Product product;

  const OffersCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailsView.routeName,
          arguments: {
            'product': product,
          },
        );
      },
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: product.producImages?[0] != null
                    ? CachedNetworkImage(
                        imageUrl: product.producImages![0],
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const ErrorImage(),
                      )
                    : const ErrorImage(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    product.title?.titleCase() ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      if (product.productTags!.length > 3)
                        ...product.productTags!.sublist(0, 3).map((e) => e)
                      else
                        ...product.productTags!.map((e) => e)
                    ]
                        .asMap()
                        .entries
                        .map(
                          (e) => TagChip(
                            e.value.toString(),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    Flexible(
                      child: Text(
                        product.productLocation ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (product.amount != 0.0)
                  Text.rich(
                    TextSpan(
                      text: '₹ ',
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(),
                      children: [
                        TextSpan(
                          text: "${product.amount}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.end,
                  ),
                if (product.amount == 0.0)
                  Text(
                    "Free",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
