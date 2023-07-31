import 'package:flutter/material.dart';
import 'package:sustainable_world/ui/modals.dart';
import 'package:sustainable_world/ui/views/orders/orders_view.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = "/settings";

  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String referralText =
        "Hello! This is Deepthi. Download Sustainable world app today from the playstore and use my referral code during registration: PKHTEFD-7654 to earn 50 points";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help_outline),
              title: const Text("Help"),
              subtitle: const Text("Help center, contact us, privacy policy"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.notifications_outlined),
              title: const Text("Notifications"),
              subtitle: const Text("Message, group & call tones"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(OrdersView.routeName);
              },
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text("Orders"),
              subtitle: const Text("Orders & History"),
            ),
            const Divider(height: 0),
            ListTile(
              onTap: () {
                Modals.showReferralCode(
                    context: context,
                    inviteCode: "PKHTEFD-7654",
                    message: referralText);
              },
              leading: const Icon(Icons.group),
              title: const Text("Invite a friend"),
              subtitle: const Text("Refer your friend to get some points"),
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
