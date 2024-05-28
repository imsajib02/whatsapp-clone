import 'package:flutter/material.dart';

import '../../barrel/widgets.dart';

class Updates extends StatelessWidget {

  const Updates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomHeader(),
      ),
    );
  }
}
