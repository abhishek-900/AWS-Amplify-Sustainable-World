import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/remote/remote_aws_auth_repository.dart';
import 'package:sustainable_world/providers/current_user_provider.dart';
import 'package:sustainable_world/ui/views/authentication/authentication_view.dart';
import 'package:sustainable_world/ui/views/home/home_view.dart';
import 'package:sustainable_world/ui/views/initialization/initialization_view_model.dart';

import '../../modular/pulsar.dart';

class InitializationView extends ConsumerWidget {
  static const String routeName = "/";

  const InitializationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(inititalizationViewModelProvider, (previous, next) async {
      var navigator = Navigator.of(context);
      var scaffoldMessenger = ScaffoldMessenger.of(context);

      if (next.isUserSignedIn) {
        ref.read(currentUserProvider).currentUser = await next.getUserProfile();

        navigator.pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);
      } else if (next.errorMessage.isNotEmpty) {
        await ref.read(remoteAWSAuthRepositoryProvider).signOut();
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text("You have been signed out"),
          ),
        );
        navigator.pushNamedAndRemoveUntil(
            AuthenticationView.routeName, (route) => false);
      } else {
        navigator.pushNamedAndRemoveUntil(
            AuthenticationView.routeName, (route) => false);
      }
    });
    return Scaffold(
      body: Center(
        child: Pulsar(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: Image.asset("assets/images/sustainable_world_logo.png"),
          ),
        ),
      ),
    );
  }
}
