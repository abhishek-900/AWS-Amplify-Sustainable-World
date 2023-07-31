import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_world/models/Product.dart';
import 'package:sustainable_world/ui/modular/location_tag.dart';
import 'package:sustainable_world/utils/error_image.dart';

import '../views/product_details/product_details_view.dart';

class RecommendationCard extends StatelessWidget {
  final Product product;

  const RecommendationCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        ProductDetailsView.routeName,
        arguments: {
          'product': product,
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: product.producImages?.first != null
                  ? Ink.image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        product.producImages![0],
                      ),
                    )
                  : const ErrorImage(),
            ),
            const SizedBox(height: 8),
            Text(product.amount == 0.0 ? "Free" : "₹${product.amount}"),
            const SizedBox(height: 4),
            Text(
              product.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            LocationTag.small(product.productLocation ?? ""),
          ],
        ),
      ),
    );
  }
}
