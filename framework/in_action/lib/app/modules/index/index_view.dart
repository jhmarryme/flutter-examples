import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_action/app/routes/app_pages.dart';

import 'index_logic.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<IndexLogic>();
    final state = Get.find<IndexLogic>().state;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text('toLogin'), onPressed: () => Get.toNamed(Routes.login)),
      ),
    );
  }
}
