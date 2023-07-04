import 'package:go_router/go_router.dart';
import 'package:product_list_task/authorization/screens/login_screen.dart';
import 'package:product_list_task/home/screens/home_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (context, state) {
            return const HomeScreen();
          },
        ),
      ],
    ),
  ],
);
