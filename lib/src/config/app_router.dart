import 'package:flutter/material.dart';
import 'package:flutter_webviewer/src/presentation/pages/export.dart';
import 'package:flutter_webviewer/src/presentation/pages/settings-page/settings_page.dart';
import 'package:flutter_webviewer/src/utils/export.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: AppRoutes.rootRouteName,
        redirect: ((context, state) =>
            state.namedLocation(AppRoutes.homeRoute))),
    GoRoute(
        path: '/home',
        name: AppRoutes.homeRoute,
        pageBuilder: (context, state) =>
            const MaterialPage<void>(child: HomePage()),
        routes: [
          GoRoute(
            path: 'settings',
            name: AppRoutes.settingsPage,
            pageBuilder: (context, state) =>
                const MaterialPage<void>(child: SettingsPage()),
          ),
        ] )
  ]);
}
