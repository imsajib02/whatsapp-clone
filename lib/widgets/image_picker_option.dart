import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../barrel/utils.dart';
import '../barrel/resources.dart';
import '../pages/profile/bloc/profile_bloc.dart';

class ImagePickerOption extends StatelessWidget {

  final IconData icon;
  final String name;
  final ImageSource source;
  final BuildContext parentContext;

  const ImagePickerOption({Key? key, required this.name, required this.icon, required this.source, required this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: BlocProvider.of<ProfileBloc>(parentContext),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pop();
          parentContext.read<ProfileBloc>().add(OnImagePickerTypeSelected(source));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: .5, color: Colors.grey[300]!),
              ),
              child: Icon(icon, color: Theme.of(context).primaryColor),
            ),

            8.h,

            Text(name,
              style: TextStyles.profileInfoTextStyle.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
