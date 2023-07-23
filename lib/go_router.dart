import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hometending_recipe/views/components/wrapper/auth_wrapper.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const AuthWrapper(),
    ),
  ],
);
