import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'not_found_logic.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NotFoundLogic>();
    final state = Get.find<NotFoundLogic>().state;

    return Container();
  }
}
