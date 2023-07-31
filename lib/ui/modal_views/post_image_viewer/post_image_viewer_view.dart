import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modal_views/image_viewer/image_viewer_view.dart';
import 'package:sustainable_world/ui/modal_views/post_image_viewer/post_image_viewer_view_model.dart';
import 'package:sustainable_world/ui/modular/vignette.dart';

class PostImageViewerView extends ConsumerWidget {
  final List<String> imageUrls;
  final int initialPage;
  final String postTitle;
  final String userName;
  final ImageProvider<Object> userImage;

  const PostImageViewerView({
    required this.imageUrls,
    required this.postTitle,
    required this.userImage,
    required this.userName,
    required this.initialPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(postImageViewerViewModelProvider(initialPage));
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            viewModel.currentPage,
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: [
              ImageViewerView(
                heroTags: imageUrls,
                pageController: viewModel.pageController,
                onImageTap: viewModel.onImageTap,
                onImageScale: viewModel.onImageScale,
                imageProviders:
                    imageUrls.map((url) => NetworkImage(url)).toList(),
                onPageChanged: viewModel.onPageChanged,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: viewModel.hudOpactity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const Vignette(),
                    PostImageViewerHeader(
                      postTitle: postTitle,
                      currentPage: 1 + viewModel.currentPage,
                      totalPages: imageUrls.length,
                    ),
                    PostImageViewerFooter(
                      userImage: userImage,
                      userName: userName,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostImageViewerHeader extends StatelessWidget {
  final String postTitle;
  final int currentPage;
  final int totalPages;

  const PostImageViewerHeader({
    required this.postTitle,
    required this.currentPage,
    required this.totalPages,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const BackButton(
              color: Colors.white,
            ),
            Expanded(
              child: Text(
                postTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Chip(
              label: Text("$currentPage / $totalPages"),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class PostImageViewerFooter extends StatelessWidget {
  final ImageProvider<Object> userImage;
  final String userName;

  const PostImageViewerFooter({
    required this.userImage,
    required this.userName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: userImage,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
