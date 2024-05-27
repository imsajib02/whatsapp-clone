import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../route/routes.dart';
import 'bloc/splash_bloc.dart';

import '../../barrel/utils.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    timeDilation = 1.0;

    return BlocProvider(
      create: (context) => SplashBloc()..add(OnStart()),
      child: BlocConsumer<SplashBloc, SplashState>(
        listenWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        listener: (context, state) {

          if(state.status.isAuthorized) {
            Router.neglect(context, () => context.pushNamed(HOME));
          }

          if(state.status.isUnauthorized) {
            Router.neglect(context, () => context.pushNamed(LOGIN));
          }
        },
        builder: (context, state) {

          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Lottie.network('https://lottie.host/feaacdeb-7f7b-490d-b8c4-d2984d2aeda9/vBe1mbhxED.json'),
              ),
            ),
          );
        },
      ),
    );
  }
}
