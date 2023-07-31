import 'package:flutter/material.dart' hide Visibility;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/models/Visibility.dart';
import 'package:sustainable_world/ui/views/dispose_form/close_dispose_form_button.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/select_organization/select_organization_view.dart';
import 'package:sustainable_world/ui/views/product_details/product_details_view.dart';

class ContributionToView extends ConsumerWidget {
  const ContributionToView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var disposeForm = ref.watch(disposeFormProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CloseDisposeFormButton(),
        ],
        title: const Text("Contribute To"),
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
                    "How do you want to contribute?",
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
                    disposeForm.setData((oldData) =>
                        {...oldData, 'visibility': Visibility.SELECTIVE});
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SelectOrganizationView(),
                      ),
                    );
                  },
                  title: const Text("Search an organization"),
                  leading: const Icon(Icons.search),
                  trailing: const Icon(Icons.chevron_right),
                  subtitle: const Text(
                    "Select a registered organization",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(height: 0),
                ListTile(
                  onTap: () {
                    disposeForm.data['selectiveRecyclers'] = null;
                    disposeForm.setData((oldData) => {
                          ...oldData,
                          'visibility': Visibility.PUBLIC,
                        });
                    Navigator.of(context).pushNamed(
                      ProductDetailsView.routeName,
                      arguments: {
                        'product': disposeForm.getPreviewProduct(),
                        'preview': true,
                      },
                    );
                  },
                  title: const Text("Post to all"),
                  leading: const Icon(Icons.post_add),
                  trailing: const Icon(Icons.chevron_right),
                  subtitle: const Text(
                    "Broadcast your listing",
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
