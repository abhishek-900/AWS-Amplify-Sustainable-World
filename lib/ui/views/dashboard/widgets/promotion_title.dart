import 'package:flutter/material.dart';
import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/models/UserType.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_view.dart';
import 'package:sustainable_world/ui/views/shop/shop_view.dart';

class PromotionTitle extends StatelessWidget {
  const PromotionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    if (mRole == UserType.RECYCLER) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Your Recycling Hub",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Are you ready to buy? Discover a variety of recyclable items from people who want to dispose of them responsibly.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShopView(),
                  ),
                );
              },
              child: const Text("Browse Items for Purchase"),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Dispose your waste",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Do you have old clothes, furniture, or other waste items that you want to dispose of responsibly? Click the button below to start the disposal process!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DisposeFormView.routeName);
              },
              child: const Text("Click Here to Start"),
            ),
          ],
        ),
      );
    }
  }
}
