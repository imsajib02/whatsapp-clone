import 'package:flutter/material.dart';

import '../barrel/utils.dart';
import '../barrel/resources.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const CustomAppbar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: -4),
            onPressed: () => Navigator.pop(context),
            icon: BackButtonIcon(),
          ),

          20.w,

          Text(title,
            style: TextStyles.appbarTitleStyle.copyWith(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
