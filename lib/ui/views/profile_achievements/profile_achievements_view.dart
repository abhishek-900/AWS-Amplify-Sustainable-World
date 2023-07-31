import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/ui/views/profile_achievements/widgets/achievement_card.dart';

import '../../../models/ModelProvider.dart';

class ProfileAchievementsView extends StatelessWidget {
  const ProfileAchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return AchievementCard(
          achievementName: (mRole == UserType.DISPOSER)
              ? disposerAchievementsName[index]
              : recyclerAchievementsName[index],
          imageUrl: imageUrls[index],
          onTap: () {
            Share.share("Congratulations! You have achieved a new milestone!");
          },
        );
      },
      itemCount: imageUrls.length,
    );
  }
}

List<String> imageUrls = [
  "assets/icons/bird.png",
];

List<String> disposerAchievementsName = [
  "25 Kg Disposed",
];
List<String> recyclerAchievementsName = [
  "50 Kg Plastics Recycled",
];
