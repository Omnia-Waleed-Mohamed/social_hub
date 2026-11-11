import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_hub/features/albums/presentation/albums_screen.dart';
import 'package:social_hub/features/auth/presentation/login_screen.dart';
import 'package:social_hub/features/home/home_screen.dart';
import 'package:social_hub/features/home/presentation/widgets/home_bottom_navigation_bar.dart';
import 'package:social_hub/features/todos/presentation/todo_screen.dart';
import 'package:social_hub/features/users/presentation/users_screen.dart';
import 'package:social_hub/generated/l10n.dart';

abstract class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: HomeBottomNavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onItemSelected: (index) {
                navigationShell.goBranch(index);
              },
              onAddPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).createPostComingSoon,
                      ),
                    ),
                  );
              },
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/users',
                builder: (context, state) => const UsersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/albums',
                builder: (context, state) => const AlbumsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/todos',
                builder: (context, state) => const TodoScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
