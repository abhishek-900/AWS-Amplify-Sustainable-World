import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/views/shop_filter/shop_filter_view_model.dart';

class ShopFilterView extends ConsumerWidget {
  const ShopFilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(shopFilterViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
        actions: [
          Material(
            color: Colors.orange,
            child: TextButton.icon(
              onPressed: () {},
              label: const Text("Clear All"),
              icon: const Icon(Icons.clear),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(model.selectedCategories);
          return true;
        },
        child: SizedBox.expand(
          child: ListView(
            children: [
              CheckboxListTile(
                value: model.categoriesExpanded,
                onChanged: (value) {
                  model.categoriesExpanded = value ?? false;
                },
                title: const Text("Categories"),
                subtitle: const Text("Filter by categories"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (model.categoriesExpanded) _buildCategories(context, model),
              const Divider(height: 4, thickness: 4),
              CheckboxListTile(
                value: model.priceExpanded,
                onChanged: (value) {
                  model.priceExpanded = value ?? false;
                },
                title: const Text("Price"),
                subtitle: const Text("Filter by price range"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (model.priceExpanded) _buildPriceRange(context, model),
              const Divider(height: 4, thickness: 4),
              CheckboxListTile(
                value: model.locationExpanded,
                onChanged: (value) {
                  model.locationExpanded = value ?? false;
                },
                title: const Text("Location"),
                subtitle: const Text("Filter by location preferences"),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (model.locationExpanded) _buildDistanceRange(context, model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context, ShopFilterViewModel model) {
    void setCategory(String category, bool value) {
      model.setSelectedCategories((old) {
        if (value) {
          return {...old, category};
        } else {
          return {...old}..remove(category);
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          InputChip(
            label: const Text("Clothes"),
            selected: model.selectedCategories.contains("Clothes"),
            onSelected: (value) => setCategory("Clothes", value),
          ),
          InputChip(
            label: const Text("Flower"),
            selected: model.selectedCategories.contains("Flower"),
            onSelected: (value) => setCategory("Flower", value),
          ),
          InputChip(
            label: const Text("Plastic"),
            selected: model.selectedCategories.contains("Plastic"),
            onSelected: (value) => setCategory("Plastic", value),
          ),
          InputChip(
            label: const Text("Paper"),
            selected: model.selectedCategories.contains("Paper"),
            onSelected: (value) => setCategory("Paper", value),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRange(BuildContext context, ShopFilterViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CheckboxListTile(
          title: const Text("Only free"),
          subtitle: const Text("Show only products available as a dontation"),
          value: model.priceFree,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) => model.priceFree = value ?? false,
        ),
        SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: RangeSlider(
            values: model.priceRange,
            onChanged:
                model.priceFree ? null : (value) => model.priceRange = value,
            min: 0,
            max: 10000,
            divisions: 100,
            labels: model.priceRangeLabels,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Free", style: Theme.of(context).textTheme.labelLarge),
              Text("Rs. 10,000+",
                  style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDistanceRange(BuildContext context, ShopFilterViewModel model) {
    return Column(
      children: [
        Slider(
          value: model.distance,
          onChanged: (value) => model.distance = value,
          min: 10,
          max: 100,
          divisions: 10,
          label: model.distanceLabel,
        ),
        Text(
          model.distanceLabel,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
