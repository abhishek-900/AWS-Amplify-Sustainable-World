import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/ContributionType.dart';
import 'package:sustainable_world/ui/views/dispose_form/close_dispose_form_button.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/post_location/post_location_view.dart';
import 'package:sustainable_world/ui/views/dispose_form/sell/sell_view.dart';

class ContributionTypeView extends ConsumerWidget {
  const ContributionTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contribution Type"),
        actions: const [
          CloseDisposeFormButton(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sell the items or donate them?",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Text(
                    "Please select one of the options below to proceed",
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ListTile(
                  onTap: () {
                    disposeForm.data['amount'] = null;
                    disposeForm.setData(
                      (oldData) => {
                        ...oldData,
                        'contributionType': ContributionType.SELL
                      },
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SellView(),
                      ),
                    );
                  },
                  title: const Text("Sell"),
                  leading: const Icon(Icons.sell),
                  trailing: const Icon(Icons.chevron_right),
                  subtitle: const Text(
                    "You are willing to sell the items for a price",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(height: 0),
                ListTile(
                  onTap: () {
                    disposeForm.data['amount'] = 0.0;
                    disposeForm.setData(
                      (oldData) => {
                        ...oldData,
                        'contributionType': ContributionType.DONATE
                      },
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PostLocationView(),
                      ),
                    );
                  },
                  title: const Text("Donate"),
                  leading: const Icon(Icons.star),
                  trailing: const Icon(Icons.chevron_right),
                  subtitle: const Text(
                    "You are willing to donate the items",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
