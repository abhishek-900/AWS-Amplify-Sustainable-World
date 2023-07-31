import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_details/campaign_details_view_model.dart';
import 'package:sustainable_world/utils/error_image.dart';
import 'package:sustainable_world/utils/utils_functions.dart';
import '../../../modular/fixed_bottom_button_bar.dart';

class CampaignDetailsView extends ConsumerWidget {
  static const String routeName = "/campaign-details";
  const CampaignDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var campaignId = ModalRoute.of(context)!.settings.arguments as dynamic;
    var model = ref.watch(campaignDetailsViewModelProvider(campaignId));

    log(model.campaign?.startDate?.format() ?? "NOTHING");

    return LoadingOverlay(
      isLoading: model.loading,
      child: Scaffold(
        bottomNavigationBar: FixedBottomButtonBar(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
            onPressed: (model.campaign?.currentUserAttending ?? false)
                ? null
                : () async {},
            child: Text(
              model.campaign?.currentUserAttending ?? false
                  ? "Registered"
                  : "Register",
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: model.campaign?.imageUrl ?? "",
                  errorWidget: (context, url, error) => const ErrorImage(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage("assets/images/buy_papers.png"),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.campaign?.title ?? "",
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                  "${model.campaign?.attendeesCount ?? 0}"
                                  " Attendees",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.blue.shade900))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                formatDay(
                                    dateTime:
                                        model.campaign?.startDate?.format()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                              ),
                              Text(
                                formatMonth(
                                    dateTime:
                                        model.campaign?.startDate?.format()),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.pink,
                                    ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          " - ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.pink),
                        ),
                        Column(
                          children: [
                            Text(
                              formatDay(
                                  dateTime: model.campaign?.endDate?.format()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                            ),
                            Text(
                              formatMonth(
                                  dateTime: model.campaign?.endDate?.format()),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.pink,
                                  ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.calendar),
                    title: Text(
                        "${formatTime(dateTime: model.campaign?.startDate)} - ${formatTime(dateTime: model.campaign?.endDate)}"),
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.bookOpenReader),
                    title: Text(
                      model.campaign?.description ?? "",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(model.campaign?.address ?? ""),
                    children: [
                      Image.network(
                        "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      )
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
