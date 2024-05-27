import 'package:flutter/material.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle get textFieldHintStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.grey[500],
  );
}