import 'package:flutter/material.dart';

import '../barrel/utils.dart';

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