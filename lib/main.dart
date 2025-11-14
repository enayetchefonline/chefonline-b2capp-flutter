import 'package:chefonline/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:chefonline/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'core/config/app_router.dart';
import 'core/config/theme_provider.dart';
import 'core/constants/app_theme.dart';
import 'features/auth/domain/usecase/register_user_usecase.dart';
import 'features/auth/presentation/provider/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            RegisterUser(AuthRepositoryImpl(AuthRemoteDataSourceImpl())),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'B2C App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.themeMode,
        routerConfig: AppRouter().router,
      ),
    );
  }
}
