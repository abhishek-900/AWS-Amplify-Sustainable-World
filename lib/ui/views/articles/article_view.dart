import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/modular/article_card.dart';
import 'package:sustainable_world/ui/views/articles/article_view_model.dart';

class ArticleView extends ConsumerWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(articleProvider).when(
          data: (data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Exploring Innovative Approaches to Waste Management",
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length.clamp(0, 4),
                  itemBuilder: (context, index) {
                    if (data[index] == null) return const SizedBox();
                    return ArticleCard(
                      article: data[index]!,
                    );
                  },
                ),
              ],
            );
          },
          error: (e, s) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
