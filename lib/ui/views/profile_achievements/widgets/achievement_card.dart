import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    required this.achievementName,
    required this.onTap,
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  final String achievementName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Text(
                  achievementName,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Positioned(
            top: 4,
            right: 4,
            child: ScaleTap(
              onPressed: onTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.share),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
