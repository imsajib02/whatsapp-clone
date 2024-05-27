import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../barrel/pages.dart';
import '../main.dart';

final String INITIAL = '/';
final String LOGIN = '/login';
final String HOME = '/home';

final router = GoRouter(
  initialLocation: INITIAL,
  routes: [

    GoRoute(
      name: INITIAL,
      path: INITIAL,
      builder: (context, state) => SplashScreen(),
    ),

    GoRoute(
      name: LOGIN,
      path: LOGIN,
      builder: (context, state) => Login(),
    ),

    GoRoute(
      name: HOME,
      path: HOME,
      builder: (context, state) => Home(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {

    final bool initialLocation = state.subloc == INITIAL;

    if(initialLocation && authUser != null) {
      return HOME;
    }

    return null;
  },
);