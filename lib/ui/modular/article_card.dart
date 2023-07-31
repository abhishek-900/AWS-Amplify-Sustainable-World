import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_world/utils/error_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/ModelProvider.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
        onTap: () async {
          await _launchUrl(
              "https://saahaszerowaste.com/blogs/textile-pollution-where-next/");
        },
        title: Row(
          children: [
            Expanded(
              child: Text(
                article.title ?? "",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  height: MediaQuery.sizeOf(context).height * 0.14,
                  imageUrl: article.imageUrl!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const ErrorImage(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
