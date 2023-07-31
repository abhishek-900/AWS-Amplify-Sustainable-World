import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sustainable_world/ui/modal_views/image_viewer/image_viewer_view_model.dart';

class ImageViewerView extends ConsumerWidget {
  final PageController pageController;
  final List<ImageProvider> imageProviders;
  final Color backgroundColor;
  final void Function(int page)? onPageChanged;
  final VoidCallback? onImageTap;
  final VoidCallback? onImageScale;
  final List<String>? heroTags;

  const ImageViewerView({
    required this.imageProviders,
    required this.pageController,
    this.backgroundColor = Colors.black,
    this.onPageChanged,
    this.onImageTap,
    this.onImageScale,
    this.heroTags,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(
        imageViewerViewModelProvider((imageProviders.length, pageController)));
    return SizedBox.expand(
      child: PhotoViewGallery.builder(
        onPageChanged: onPageChanged,
        backgroundDecoration: BoxDecoration(
          color: backgroundColor,
        ),
        gaplessPlayback: true,
        loadingBuilder: (context, chunk) =>
            const Center(child: CircularProgressIndicator()),
        itemCount: viewModel.numImages,
        pageController: viewModel.pageController,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            heroAttributes: heroTags != null
                ? PhotoViewHeroAttributes(
                    tag: heroTags![index],
                  )
                : null,
            onTapUp: (_, __, ___) => onImageTap?.call(),
            onScaleEnd: (_, __, ___) => onImageScale?.call(),
            imageProvider: imageProviders[index],
            controller: viewModel.photoControllers[index],
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained * 6,
          );
        },
      ),
    );
  }
}
