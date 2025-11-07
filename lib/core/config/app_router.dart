


import 'package:chefonline/features/auth/presentation/screen/login_screen.dart';
import 'package:chefonline/features/auth/presentation/screen/register_screen.dart';
import 'package:chefonline/features/cart/presentation/screen/cart_screen.dart';
import 'package:chefonline/features/edit_profile/presenatation/edit_screen.dart';
import 'package:chefonline/features/init_screen.dart';
import 'package:chefonline/features/order_history/presenatation/screen/order_history_screen.dart';
import 'package:chefonline/features/profile/presentation/screen/profile_screen.dart';
import 'package:chefonline/features/reset_password/presentation/reset_screen.dart';
import 'package:chefonline/features/search/presentation/screen/search_screen.dart';
import 'package:chefonline/features/settings/presentation/screen/settings_screen.dart';
import 'package:chefonline/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

/// Separate navigator keys (optional, helps maintain state per tab)
final GlobalKey<NavigatorState> searchNavKey =
GlobalKey<NavigatorState>(debugLabel: 'searchNav');
final GlobalKey<NavigatorState> cartNavKey =
GlobalKey<NavigatorState>(debugLabel: 'cartNav');
final GlobalKey<NavigatorState> profileNavKey =
GlobalKey<NavigatorState>(debugLabel: 'profileNav');
final GlobalKey<NavigatorState> settingsNavKey =
GlobalKey<NavigatorState>(debugLabel: 'settingsNav');

/// Router Configuration
class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  AppRouter._internal();
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/init_screen',
    routes: <RouteBase>[
      GoRoute(
        path: '/init_screen',
        builder: (context, state) => const InitScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
            ) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          // 🔍 SEARCH
          StatefulShellBranch(
            navigatorKey: searchNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/search',
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          // 🛒 CART
          StatefulShellBranch(
            navigatorKey: cartNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/cart',
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),
          // 👤 PROFILE
          StatefulShellBranch(
            navigatorKey: profileNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                builder: (context, state) {
                  final bool loggedIn = true;
                  return loggedIn
                      ? const ProfileScreen()
                      : const LoginScreen();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'register',
                    builder:
                        (BuildContext context, GoRouterState state) =>
                        RegisterScreen(),
                  ),
                  GoRoute(
                    path: 'login',
                    builder:
                        (BuildContext context, GoRouterState state) =>
                        LoginScreen(),
                  ),
                  GoRoute(
                    path: 'order_history',
                    builder:
                        (BuildContext context, GoRouterState state) =>
                        OrderHistoryScreen(),
                  ),
                  GoRoute(
                    path: 'edit_screen',
                    builder:
                        (BuildContext context, GoRouterState state) =>
                        EditScreen(),
                  ),
                  GoRoute(
                    path: 'reset_password',
                    builder:
                        (BuildContext context, GoRouterState state) =>
                            ResetPasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
          // ⚙️ SETTINGS
          StatefulShellBranch(
            navigatorKey: settingsNavKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}