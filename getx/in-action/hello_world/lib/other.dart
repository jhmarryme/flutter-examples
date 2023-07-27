import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hello_world_controller.dart';

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你
  final HelloWorldController controller = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        // 访问更新后的计数变量
        title: Obx(() => Text('Clicks: ${controller.count}')),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text("Go Back"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
