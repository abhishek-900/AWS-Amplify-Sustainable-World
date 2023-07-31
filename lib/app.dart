import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/app_router.dart';
import 'package:sustainable_world/app_theme.dart';
import 'package:sustainable_world/ui/views/initialization/initialization_view.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Sustainable World',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.watch(themeProvider),
      routes: AppRouter.routes,
      initialRoute: InitializationView.routeName,
    );
  }
}
