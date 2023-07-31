import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

var imageViewerViewModelProvider =
    ChangeNotifierProvider.family<ImageViewerViewModel, (int, PageController)>(
  (ref, record) => ImageViewerViewModel(
    numImages: record.$1,
    pageController: record.$2,
  ),
);

class ImageViewerViewModel extends ChangeNotifier {
  final PageController pageController;
  late final List<PhotoViewController> _photoControllers;
  late final int _numImages;

  ImageViewerViewModel({
    required final int numImages,
    required this.pageController,
  }) {
    _numImages = numImages;
    _photoControllers = List<PhotoViewController>.generate(
      _numImages,
      (_) => PhotoViewController(),
    );
    _setupListeners();
  }

  void _setupListeners() {
    pageController.addListener(
      () {
        if (pageController.hasClients) {
          final double fractionalPage = pageController.page!;
          final double roundPage = fractionalPage.roundToDouble();
          if (roundPage == fractionalPage) {
            int prevIndex = roundPage.toInt() - 1;
            int nextIndex = prevIndex + 2;
            if (prevIndex >= 0 && prevIndex < _numImages) {
              _photoControllers[prevIndex].reset();
            }
            if (nextIndex >= 0 && nextIndex < _numImages) {
              _photoControllers[nextIndex].reset();
            }
          }
        }
      },
    );
  }

  List<PhotoViewController> get photoControllers => _photoControllers;

  int get numImages => _numImages;

  @override
  void dispose() {
    for (PhotoViewController pvc in _photoControllers) {
      pvc.dispose();
    }
    super.dispose();
  }
}
