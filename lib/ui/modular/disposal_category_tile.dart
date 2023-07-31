import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sustainable_world/utils/error_image.dart';

class DisposalCategoryTile extends StatelessWidget {
  const DisposalCategoryTile({
    required this.onPressed,
    required this.labelText,
    required this.image,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String labelText;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: GridTile(
          footer: GridTileBar(
            title: Text(labelText),
            backgroundColor: Colors.black54,
          ),
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: image!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const ErrorImage(),
                  ),
                )
              : const ErrorImage(),
        ),
      ),
    );
  }
}
