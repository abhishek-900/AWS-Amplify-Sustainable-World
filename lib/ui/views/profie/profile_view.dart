import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/providers/current_user_provider.dart';
import 'package:sustainable_world/ui/views/home_statistics/home_statistics_view.dart';
import 'package:sustainable_world/ui/views/profile_achievements/profile_achievements_view.dart';
import 'package:sustainable_world/ui/views/settings/settings_view.dart';

import '../authentication/authentication_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(currentUserProvider).currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsView.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
          TextButton.icon(
            onPressed: () async {
              var navigator = Navigator.of(context);
              await ref.read(remoteAWSAuthRepositoryProvider).signOut();

              navigator.pushNamedAndRemoveUntil(
                  AuthenticationView.routeName, (route) => false);
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
          )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/profile_pic.png"),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "${user?.firstName} ${user?.lastName ?? ""}",
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Text(
                  "User since: 25 July, 2023",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
              ],
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                body: Column(
                  children: [
                    const TabBar(
                      isScrollable: false,
                      tabs: [
                        Tab(
                          text: "Achievements",
                        ),
                        Tab(text: "Total Contributions"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          const ProfileAchievementsView(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeStatisticsView(onPressedViewMore: () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
