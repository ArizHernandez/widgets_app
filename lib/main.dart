import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: appTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
