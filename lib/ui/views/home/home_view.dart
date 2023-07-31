import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/models/UserType.dart';
import 'package:sustainable_world/ui/modular/app_navigation_bar_item.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_view.dart';
import 'package:sustainable_world/ui/views/home/home_view_model.dart';
import 'package:sustainable_world/ui/views/your_offers/your_offers_view.dart';

import '../dispose_form/dispose_form_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  static const String routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    var dispose = ref.watch(disposeFormProvider);
    var model = ref.watch(homeViewModelProvider);

    return Scaffold(
      body: model.pages[model.bottomNavBarIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mRole == UserType.DISPOSER) {
            dispose.setData((oldData) => {});
            Navigator.of(context).pushNamed(DisposeFormView.routeName);
          } else {
            Navigator.of(context).pushNamed(YourOffers.routeName);
          }
        },
        child: Icon(
          mRole == UserType.DISPOSER
              ? LineIcons.leaf
              : Icons.local_offer_outlined,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppNavigationBarItem(
                active: model.bottomNavBarIndex == 0,
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home_filled),
                label: "Home",
                onTap: () {
                  model.bottomNavBarIndex = 0;
                },
              ),
              AppNavigationBarItem(
                active: model.bottomNavBarIndex == 1,
                icon: const Icon(Icons.groups_outlined),
                activeIcon: const Icon(Icons.groups),
                label: "Community",
                onTap: () {
                  model.bottomNavBarIndex = 1;
                },
              ),
              const SizedBox(width: 16),
              AppNavigationBarItem(
                active: model.bottomNavBarIndex == 2,
                icon: Icon(mRole == UserType.DISPOSER
                    ? Icons.star_border
                    : Icons.shop_outlined),
                activeIcon:
                    Icon(mRole == UserType.DISPOSER ? Icons.star : Icons.shop),
                label: mRole == UserType.DISPOSER ? "Posts" : "Shop",
                onTap: () {
                  model.bottomNavBarIndex = 2;
                },
              ),
              AppNavigationBarItem(
                active: model.bottomNavBarIndex == 3,
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: "Profile",
                onTap: () {
                  model.bottomNavBarIndex = 3;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
