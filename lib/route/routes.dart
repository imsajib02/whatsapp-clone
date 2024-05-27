import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../barrel/pages.dart';

final String INITIAL = '/';

final router = GoRouter(
  initialLocation: INITIAL,
  routes: [

    GoRoute(
      name: INITIAL,
      path: INITIAL,
      builder: (context, state) => Login(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {

    final bool initialLocation = state.subloc == INITIAL;

    /*if(initialLocation && currentUser != null && currentUser!.isLoggedIn()) {
      return DASHBOARD;
    }*/

    return null;
  },
);