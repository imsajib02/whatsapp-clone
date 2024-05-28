import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../barrel/localization.dart';
import '../barrel/resources.dart';
import '../barrel/utils.dart';
import '../barrel/widgets.dart';

void showSnackBar({required BuildContext context, required String message, required SnackBarType snackBarType}) {

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: snackBarType.color,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1200),
  ));
}

void showLoader(BuildContext context) {

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {

      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void showProfileImagePicker(BuildContext parentContext) {

  showModalBottomSheet(
    context: parentContext,
    backgroundColor: Colors.transparent,
    builder: (context) {

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            8.h,

            Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            30.h,

            Align(
              alignment: Alignment.centerLeft,
              child: Text(AppLocalization.of(context)!.getTranslatedValue('profile_photo')!,
                style: TextStyles.appbarTitleStyle.copyWith(
                  color: Colors.black,
                ),
              ),
            ),

            30.h,

            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ImagePickerOption(
                    parentContext: parentContext,
                    source: ImageSource.camera,
                    icon: Icons.camera_alt_outlined,
                    name: AppLocalization.of(context)!.getTranslatedValue('camera')!,
                  ),

                  40.w,

                  ImagePickerOption(
                    parentContext: parentContext,
                    source: ImageSource.gallery,
                    icon: Icons.image_outlined,
                    name: AppLocalization.of(context)!.getTranslatedValue('gallery')!,
                  ),
                ],
              ),
            ),

            20.h,
          ],
        ),
      );
    },
  );
}