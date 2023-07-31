import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/ui/views/dashboard/dashboard_view.dart';
import 'package:sustainable_world/ui/views/profie/profile_view.dart';
import 'package:sustainable_world/ui/views/shop/shop_view.dart';
import 'package:sustainable_world/ui/views/social/social_view.dart';

import '../../../models/ModelProvider.dart';
import '../my_posts/my_posts_view.dart';

var homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeViewModel with ChangeNotifier {
  int _bottomNavBarIndex;
  final List<Widget> _pages = [
    const DashBoardView(),
    const SocialView(),
    mRole == UserType.DISPOSER ? const MyPostsView() : const ShopView(),
    const ProfileView(),
  ];

  HomeViewModel() : _bottomNavBarIndex = 0 {
    log("${mRole}homeviewmodel");
  }

  int get bottomNavBarIndex => _bottomNavBarIndex;
  List<Widget> get pages => _pages;

  set bottomNavBarIndex(int index) {
    _bottomNavBarIndex = index;
    notifyListeners();
  }
}
