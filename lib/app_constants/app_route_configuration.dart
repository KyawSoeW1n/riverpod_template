import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_testing/app_constants/app_routes.dart';
import 'package:riverpod_testing/features/post/post_screen.dart';

import '../features/setting/setting_screen.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.post,
      builder: (BuildContext context, GoRouterState state) {
        return const PostScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.setting,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingScreen();
          },
        ),
      ],
    ),
  ],
);
