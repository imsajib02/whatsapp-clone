import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../barrel/utils.dart';
import '../../barrel/localization.dart';
import '../../barrel/resources.dart';
import '../../barrel/widgets.dart';
import '../../route/routes.dart';
import 'bloc/auth_bloc.dart';

class Login extends StatelessWidget {

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        listener: (context, state) {

          if(state.status.isLoading) {
            showLoader(context);
          }

          if(state.status.isAuthorized) {
            Navigator.of(context).pop();
            Router.neglect(context, () => context.pushNamed(HOME));
          }

          if(state.status.hasFailed) {
            Navigator.of(context).pop();
            showSnackBar(
              context: context,
              message: AppLocalization.of(context)!.getTranslatedValue('authentication_failed')!,
              snackBarType: SnackBarType.error
            );
          }
        },
        builder: (context, state) {

          return WillPopScope(
            onWillPop: () {
              SystemNavigator.pop();
              return Future(() => false);
            },
            child: Scaffold(
              body: Builder(
                builder: (context) {

                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          70.h,

                          Text(AppLocalization.of(context)!.getTranslatedValue('welcome_msg')!,
                            textAlign: TextAlign.center,
                            style: TextStyles.appbarTitleStyle.copyWith(
                              fontSize: 35,
                            ),
                          ),

                          90.h,

                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/social.png'),
                              ),
                            ),
                          ),

                          150.h,

                          Text(AppLocalization.of(context)!.getTranslatedValue('sign_in_msg')!,
                            textAlign: TextAlign.center,
                            style: TextStyles.textFieldHintStyle,
                          ),

                          20.h,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () => context.read<AuthBloc>().add(SignInWithGoogle()),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                                    child: Text(AppLocalization.of(context)!.getTranslatedValue('sign_in')!.toUpperCase()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
