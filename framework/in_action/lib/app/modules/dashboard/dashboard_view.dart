import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('测试用', style: TextStyle(fontSize: 20)),
              Text('Time: ${controller.now.value.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
