import 'package:devtest/core/core.dart';
import 'package:devtest/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerApp = GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: navigatorKey,
  initialLocation: RoutesPath.home,
  routes: [
    GoRoute(
      path: RoutesPath.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
