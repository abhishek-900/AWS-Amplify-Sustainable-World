import 'dart:io';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/amplifyconfiguration.dart';
import 'package:sustainable_world/app.dart';
import 'package:sustainable_world/models/ModelProvider.dart';

UserType mRole = UserType.DISPOSER;
bool kForceNewLoginSession = false;
bool kLogDioRequests = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await _configureAmplify();
  HttpOverrides.global = IgnoreBadCertificateHttpOverrides();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final auth = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();

    await Amplify.addPlugin(storage);
    await Amplify.addPlugin(api);
    await Amplify.addPlugin(auth);

    await Amplify.configure(amplifyconfig);
  } on Exception catch (e) {
    safePrint('An error occurred configuring Amplify: $e');
  }
}

class IgnoreBadCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
