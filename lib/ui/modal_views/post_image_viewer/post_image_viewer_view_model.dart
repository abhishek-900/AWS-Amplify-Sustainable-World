import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var postImageViewerViewModelProvider =
    ChangeNotifierProvider.family<PostImageViewerViewModel, int>(
  (ref, page) => PostImageViewerViewModel(initialPage: page),
);

class PostImageViewerViewModel extends ChangeNotifier {
  late final PageController _pageController;
  late int currentPage;
  late bool _showHUD;

  PostImageViewerViewModel({
    required final int initialPage,
  }) {
    _showHUD = true;
    _pageController = PageController(initialPage: initialPage);
    currentPage = initialPage;
  }

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void onImageTap() {
    _showHUD = !_showHUD;
    notifyListeners();
  }

  void onImageScale() {
    _showHUD = false;
    notifyListeners();
  }

  PageController get pageController => _pageController;

  double get hudOpactity => _showHUD ? 1 : 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
