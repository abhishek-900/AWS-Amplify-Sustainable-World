import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modular/disposal_category_tile.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/post_details/post_details_view.dart';

import '../../../models/ProductCategory.dart';

class DisposeFormView extends ConsumerWidget {
  static const String routeName = "/dispose-form";

  const DisposeFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Category"),
      ),
      body: ref.watch(disposeCategoriesProvider).when(
            data: (data) {
              return _buildBody(context, data, ref);
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
          ),
    );
  }

  _buildBody(
      BuildContext context, List<ProductCategory?> categories, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "What would you like to dispose?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                  "Select one of the categories below to proceed",
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(4),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1.4,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DisposalCategoryTile(
                  onPressed: () {
                    _setCategory(
                      context,
                      categories[index]!,
                      ref.read(disposeFormProvider),
                    );
                  },
                  labelText: categories[index]?.title ?? "",
                  image: categories[index]?.imageUrl,
                );
              },
              childCount: categories.length,
            ),
          ),
        ),
      ],
    );
  }

  void _setCategory(BuildContext context, ProductCategory category,
      DisposeFormProvider disposeForm) {
    disposeForm.setData((oldData) {
      return {
        ...oldData,
        'productcategoryID': category.id,
      };
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PostDetailsView(),
      ),
    );
  }
}
