import 'package:flutter/material.dart';

import '../../barrel/widgets.dart';

class Communities extends StatelessWidget {

  const Communities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomHeader(),
      ),
    );
  }
}
