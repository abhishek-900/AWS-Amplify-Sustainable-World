import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modular/campaign_card.dart';
import 'package:sustainable_world/ui/views/campaign/campaign_view_model.dart';

import 'campaign_details/campaign_details_view.dart';

class CampaignView extends ConsumerWidget {
  static const String routeName = "/campaign";
  const CampaignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campaigns"),
      ),
      body: ref.watch(campaignsProvider).when(
            data: (campaigns) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: campaigns.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          CampaignDetailsView.routeName,
                          arguments: campaigns[index]!.modelIdentifier);
                    },
                    child: SizedBox(
                      height: 200,
                      child: CampaignCard(
                        campaign: campaigns[index]!,
                      ),
                    ),
                  );
                },
              );
            },
            error: (e, s) => const Center(child: Text("Error")),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
