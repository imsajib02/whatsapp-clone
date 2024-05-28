import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../barrel/pages.dart';
import '../main.dart';

final String INITIAL = '/';
final String LOGIN = '/login';
final String HOME = '/home';
final String PROFILE = '/profile';

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

    GoRoute(
      name: PROFILE,
      path: PROFILE,
      pageBuilder: (context, state) {

        return CustomTransitionPage(
          key: state.pageKey,
          child: Profile(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {

            return ScaleTransition(
              scale: CurveTween(curve: Curves.easeIn).animate(animation),
              alignment: Alignment.topLeft,
              child: child,
            );
          },
        );
      },
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