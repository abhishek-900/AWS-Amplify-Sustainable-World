import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/views/your_offers/offers_card.dart';
import 'package:sustainable_world/ui/views/your_offers/your_offers_view_model.dart';

class YourOffers extends ConsumerWidget {
  static const String routeName = "/your-offers";

  const YourOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exculsive Offers")),
      body: ref.watch(offersViewModelProvider).when(
            data: (offers) {
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemBuilder: (context, index) {
                  return OffersCard(
                    product: offers[index]!,
                  );
                },
                itemCount: offers.length,
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
