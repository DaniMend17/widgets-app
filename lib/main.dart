import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/app_theme_provider.dart';


void main() {
  runApp(
    const ProviderScope(
    child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final int selectedThemeColor = ref.watch(selectedIndexColorProvider);
    // final bool isDarkMode = ref.watch(isDarkProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);


    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectedColor: 0).getTheme(),
      // theme: AppTheme(selectedColor: selectedThemeColor, isDarkMode: isDarkMode).getTheme(),
      theme: appTheme.getTheme()
    );
  }
}
