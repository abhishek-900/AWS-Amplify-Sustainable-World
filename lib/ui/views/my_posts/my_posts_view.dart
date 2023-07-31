import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modular/my_post_card.dart';
import 'package:sustainable_world/ui/views/my_posts/my_posts_view_model.dart';

class MyPostsView extends ConsumerWidget {
  const MyPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(myPostViewModelProvider);
    final products = model.myPosts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Posts"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 80),
          itemBuilder: (context, index) {
            return MyPostCard(
              onTap: () {},
              product: products[index]!,
            );
          },
          itemCount: products.length,
        ),
      ),
    );
  }
}
