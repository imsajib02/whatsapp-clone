import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: kAccentColor,
  );

  static TextStyle get textFieldHintStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.grey[500],
  );

  static TextStyle get bottomBarTextStyle => TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
}