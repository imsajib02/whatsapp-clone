import 'package:flutter/material.dart';

import '../../barrel/widgets.dart';

class Chats extends StatelessWidget {

  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomHeader(),
      ),
    );
  }
}
