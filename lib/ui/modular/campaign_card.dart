import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

import 'package:sustainable_world/ui/views/campaign/campaign_details/campaign_details_view.dart';
import 'package:sustainable_world/utils/error_image.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({
    required this.campaign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CampaignDetailsView.routeName,
            arguments: campaign.modelIdentifier);
      },
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 0.5,
            )),
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: campaign.imageUrl!,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const ErrorImage(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                width: size.width * 0.4,
                child: Text(
                  campaign.title ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).primaryColor),
                child: Text(
                  "Attending: ${campaign.attendeesCount ?? 0}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
