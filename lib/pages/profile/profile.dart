import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../barrel/resources.dart';
import '../../barrel/utils.dart';
import '../../barrel/localization.dart';
import '../../barrel/widgets.dart';
import '../../main.dart';
import 'bloc/profile_bloc.dart';

class Profile extends StatelessWidget {

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {

          return SafeArea(
            child: Scaffold(
              appBar: CustomAppbar(
                title: AppLocalization.of(context)!.getTranslatedValue('profile')!,
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    25.h,

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [

                            Hero(
                              tag: 'avatar',
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(authUser?.photoUrl ?? '',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 6,
                              right: 6,
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  color: jadeGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 22),
                                  onPressed: () => showProfileImagePicker(context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    40.h,

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [

                          _info(
                            icon: Icons.person_outline,
                            title: AppLocalization.of(context)!.getTranslatedValue('name')!,
                            value: authUser?.name ?? '',
                          ),

                          Divider(),

                          _info(
                            icon: Icons.phone_outlined,
                            title: AppLocalization.of(context)!.getTranslatedValue('phone')!,
                            value: authUser?.phone ?? '',
                          ),

                          Divider(),

                          _info(
                            icon: Icons.email_outlined,
                            title: AppLocalization.of(context)!.getTranslatedValue('email')!,
                            value: authUser?.email ?? '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _info({required IconData icon, required String title, required String value}) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Icon(icon, size: 22, color: Colors.grey[600]),

          20.w,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(title,
                style: TextStyles.profileInfoTextStyle,
              ),

              5.h,

              Text(value,
                style: TextStyles.profileInfoTextStyle.copyWith(
                  fontSize: 15,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
