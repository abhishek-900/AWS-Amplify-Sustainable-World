import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/app_theme.dart';
import 'package:sustainable_world/models/UserType.dart';
import 'package:sustainable_world/ui/modular/recommendation_card.dart';
import 'package:sustainable_world/ui/views/articles/article_view.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_view.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_view_model.dart';
import 'package:sustainable_world/ui/views/dashboard/dashboard_view_model.dart';
import 'package:sustainable_world/ui/views/dashboard/widgets/location_widget.dart';
import 'package:sustainable_world/ui/views/dashboard/widgets/promotion_title.dart';
import 'package:sustainable_world/ui/views/notification/notification_view.dart';
import 'package:sustainable_world/ui/views/product_details/product_details_view.dart';

import '../../../main.dart';
import '../../modular/campaign_card.dart';

class DashBoardView extends ConsumerWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const LocationWidget(),
        actions: [
          Consumer(
            builder: (context, ref, child) => IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              icon: ref.watch(themeProvider) == ThemeMode.dark
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationView.routeName);
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const PromotionTitle(),
            Container(
              height: 220,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ref.watch(campaignsProvider).when(
                    data: (data) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Nearby Campaigns",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, CampaignView.routeName);
                                },
                                style: OutlinedButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text("View all"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CampaignCard(
                                campaign: data[index]!,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    error: (e, s) => Center(child: Text(e.toString())),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: mRole == UserType.RECYCLER,
              child: ref.watch(productRecommendationProvider).when(
                    data: (recommendation) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Recommended Products",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, CampaignView.routeName);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text("View all"),
                                ),
                              ],
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: recommendation.length.clamp(0, 4),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      Navigator.of(context).pushNamed(
                                        ProductDetailsView.routeName,
                                        arguments: {
                                          'product': recommendation[index],
                                        },
                                      );
                                    },
                                    child: RecommendationCard(
                                      product: recommendation[index],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      );
                    },
                    error: (e, s) => Center(child: Text(e.toString())),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const ArticleView(),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
