import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../barrel/localization.dart';
import '../../barrel/pages.dart';
import '../../barrel/widgets.dart';
import 'bloc/home_bloc.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          return Scaffold(
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: .5, color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  BottomBarItem(
                    onTap: (index) => context.read<HomeBloc>().add(OnNavItemTap(index)),
                    index: 0,
                    inactiveImagePath: 'assets/images/chat.png',
                    activeImagePath: 'assets/images/chat_active.png',
                    label: AppLocalization.of(context)!.getTranslatedValue('chats')!,
                  ),

                  BottomBarItem(
                    onTap: (index) => context.read<HomeBloc>().add(OnNavItemTap(index)),
                    index: 1,
                    inactiveImagePath: 'assets/images/update.png',
                    activeImagePath: 'assets/images/update_active.png',
                    label: AppLocalization.of(context)!.getTranslatedValue('updates')!,
                  ),

                  BottomBarItem(
                    onTap: (index) => context.read<HomeBloc>().add(OnNavItemTap(index)),
                    index: 2,
                    inactiveImagePath: 'assets/images/community.png',
                    activeImagePath: 'assets/images/community_active.png',
                    label: AppLocalization.of(context)!.getTranslatedValue('communities')!,
                  ),

                  BottomBarItem(
                    onTap: (index) => context.read<HomeBloc>().add(OnNavItemTap(index)),
                    index: 3,
                    inactiveImagePath: 'assets/images/call.png',
                    activeImagePath: 'assets/images/call_active.png',
                    label: AppLocalization.of(context)!.getTranslatedValue('calls')!,
                  ),
                ],
              ),
            ),
            body: IndexedStack(
              index: state.currentIndex,
              children: [

                Chats(),

                Updates(),

                Communities(),

                Calls(),
              ],
            ),
          );
        },
      ),
    );
  }
}
