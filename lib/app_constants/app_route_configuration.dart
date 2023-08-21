import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/app_constants/app_routes.dart';
import 'package:riverpod_testing/features/photo/photo_screen.dart';
import 'package:riverpod_testing/features/post/post_screen.dart';

import '../features/favourite_posts/favourite_posts_screen.dart';
import '../features/setting/setting_screen.dart';
import '../features/user/user_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.post,
      builder: (BuildContext context, GoRouterState state) {
        return PostScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.setting,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.photo,
          builder: (BuildContext context, GoRouterState state) {
            return PhotoScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.favourite,
          builder: (BuildContext context, GoRouterState state) {
            return FavouritePostsScreen();
          },
        ),
        GoRoute(
          path: AppRoutes.user,
          builder: (BuildContext context, GoRouterState state) {
            return UserScreen();
          },
        ),
      ],
    ),
  ],
);
