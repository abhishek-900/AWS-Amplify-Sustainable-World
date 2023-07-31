import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sustainable_world/models/Product.dart';

import 'package:sustainable_world/ui/modals.dart';
import 'package:sustainable_world/ui/modular/fixed_bottom_button_bar.dart';
import 'package:sustainable_world/ui/modular/location_tag.dart';
import 'package:sustainable_world/ui/modular/verified_tag.dart';
import 'package:sustainable_world/ui/views/home/home_view.dart';
import 'package:sustainable_world/ui/views/payment/payment_view.dart';
import 'package:sustainable_world/ui/modular/seller_card.dart';
import 'package:sustainable_world/ui/views/product_details/product_details_view_model.dart';

import '../../modular/tag_chip.dart';

class ProductDetailsView extends ConsumerWidget {
  static const String routeName = "/product-details";

  const ProductDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Product product = data['product'];
    final bool previewMode = data['preview'] ?? false;

    final double headerHeight = MediaQuery.of(context).size.height * 0.3;
    var model = ref.watch(productDetailsViewModelProvider);

    return Scaffold(
      bottomNavigationBar: FixedBottomButtonBar(
        child: ElevatedButton(
          onPressed: () async {
            if (previewMode) {
              var scaffoldMessenger = ScaffoldMessenger.of(context);
              var navigator = Navigator.of(context);
              await model.createPost(product: product);
              scaffoldMessenger.showSnackBar(
                const SnackBar(
                  content: Text("Posted Successfully"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              navigator.popUntil(
                ModalRoute.withName(HomeView.routeName),
              );
            } else {
              var scaffoldMessenger = ScaffoldMessenger.of(context);
              var navigator = Navigator.of(context);
              if (product.amount == 0) {
                await model.createOrder(product: product);
                scaffoldMessenger.showSnackBar(
                  const SnackBar(
                    content: Text("Claimed Successfully"),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                navigator.popUntil(
                  ModalRoute.withName(HomeView.routeName),
                );
              } else {
                await navigator.pushNamed(PaymentView.routeName,
                    arguments: product);
              }
            }
          },
          child: Text(
            !previewMode
                ? (product.amount == 0
                    ? "Claim for free!"
                    : "Buy now for ${NumberFormat.simpleCurrency(locale: 'en_IN', decimalDigits: 0).format(product.amount)}")
                : "Post",
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(previewMode ? "Review your post" : product.title!),
            actions: const [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Viewed 0 times"),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: headerHeight,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    itemCount: product.producImages?.length ?? 0,
                    controller: model.pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: previewMode
                            ? null
                            : () async {
                                int? index = await Modals.showPostImageViewer(
                                  context,
                                  imageUrls: [],
                                  postTitle: product.title!,
                                  initialPage:
                                      model.pageController.page!.round(),
                                  userImage: const AssetImage(
                                      "assets/images/profile_pic.png"),
                                  userName: "Abhishek Singh",
                                );
                                if (index == null) return;
                                model.pageController.jumpToPage(index);
                              },
                        child: Hero(
                          tag: product.producImages?[index] ?? UniqueKey(),
                          child: Material(
                            child: Ink.image(
                              image: previewMode
                                  ? FileImage(
                                      File(product.producImages![index]),
                                    ) as ImageProvider
                                  : CachedNetworkImageProvider(
                                      product.producImages![index],
                                    ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (product.producImages!.length > 1)
                    Positioned(
                      child: SizedBox(
                        height: 48,
                        child: SmoothPageIndicator(
                          key: const ValueKey("PageIndicator"),
                          onDotClicked: (index) {
                            int? currentIndex =
                                model.pageController.page?.toInt();
                            if (currentIndex != null) {
                              int nearestStartingIndex = (currentIndex ~/
                                      product.producImages!.length) *
                                  product.producImages!.length;
                              model.pageController.animateToPage(
                                nearestStartingIndex + index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                          },
                          controller: model.pageController,
                          count: product.producImages!.length,
                          effect: const WormEffect(
                            dotWidth: 16,
                            dotHeight: 8,
                            dotColor: Colors.white24,
                            activeDotColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "₹ ${product.amount == 0.0 ? "Free" : product.amount}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const VerifiedTag.large(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(product.title!,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  LocationTag.medium(product.productLocation!),
                  const SizedBox(height: 16),
                  Text(product.description ?? ""),
                  const SizedBox(height: 8),
                  Text("weight: ${product.weight!}Kg"),
                  const SizedBox(height: 16),
                  Wrap(
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
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          if (!previewMode)
            const SliverToBoxAdapter(
              child: SellerCard(),
            ),
        ],
      ),
    );
  }
}
