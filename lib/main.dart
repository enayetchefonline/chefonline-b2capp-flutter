import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/app_router.dart';
import 'core/config/theme_provider.dart';
import 'core/constants/app_theme.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'B2C App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      routerConfig: AppRouter().router,
    );
  }
}