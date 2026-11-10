import 'package:go_router/go_router.dart';
import 'package:social_hub/features/auth/presentation/login_screen.dart';
import 'package:social_hub/features/home/home_screen.dart';

abstract class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
}
