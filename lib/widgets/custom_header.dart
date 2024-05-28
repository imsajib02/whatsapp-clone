import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../barrel/localization.dart';
import '../barrel/resources.dart';
import '../barrel/utils.dart';
import '../main.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../route/routes.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {

  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          return Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .5, color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(AppLocalization.of(context)!.getTranslatedValue(state.headerLocaleKey)!,
                  style: TextStyles.appbarTitleStyle.copyWith(
                    fontSize: 22,
                    color: state.currentIndex == 0 ? jadeGreen : Colors.black87,
                    fontWeight: state.currentIndex == 0 ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      iconSize: 25,
                    ),

                    5.w,

                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => context.pushNamed(PROFILE),
                      child: Hero(
                        tag: 'avatar',
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(authUser?.photoUrl ?? ''),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
