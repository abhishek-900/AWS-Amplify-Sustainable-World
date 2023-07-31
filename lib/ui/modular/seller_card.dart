import 'package:flutter/material.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile_pic.png")),
      title: const Text(
        "Abhishek Singh",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.info_outline),
      subtitle: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: const Icon(Icons.star, color: Colors.blue),
              ),
            ),
            TextSpan(
                text: "Trusted seller",
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
