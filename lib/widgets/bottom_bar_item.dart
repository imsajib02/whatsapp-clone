import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../barrel/resources.dart';
import '../barrel/utils.dart';
import '../pages/home/bloc/home_bloc.dart';

class BottomBarItem extends StatelessWidget {

  final String inactiveImagePath;
  final String activeImagePath;
  final String label;
  final int index;
  final Function(int) onTap;

  const BottomBarItem({Key? key, required this.inactiveImagePath, required this.label, required this.activeImagePath,
    required this.onTap, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: BlocProvider.of<HomeBloc>(context),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

          var containerColor = index == state.currentIndex ? Theme.of(context).primaryColor.withOpacity(.35) : Colors.transparent;

          return Expanded(
            flex: 1,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(index == state.currentIndex ? activeImagePath : inactiveImagePath,
                      scale: 4,
                    ),
                  ),

                  7.h,

                  Text(label,
                    style: TextStyles.bottomBarTextStyle.copyWith(
                      fontWeight: index == state.currentIndex ? FontWeight.bold : FontWeight.w500,
                      color: index == state.currentIndex ? Colors.black : Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
