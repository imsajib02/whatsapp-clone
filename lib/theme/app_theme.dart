import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../barrel/resources.dart';

class AppTheme {

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
      background: kBackgroundColorLight,
    ),
    scaffoldBackgroundColor: kBackgroundColorLight,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    focusColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
      background: kBackgroundColorDark,
    ),
    scaffoldBackgroundColor: kBackgroundColorDark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    focusColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ),
  );
}