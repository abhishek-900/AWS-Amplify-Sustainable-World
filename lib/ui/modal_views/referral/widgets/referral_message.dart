import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ReferralMessage extends StatelessWidget {
  const ReferralMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "Invite your friends to join the community.\n",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600)),
          TextSpan(
              text: "Get 50 coins",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(LineIcons.coins, size: 28, color: Color(0xffE1B530)),
          ),
          TextSpan(
              text: " when they register using your referral code.",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
