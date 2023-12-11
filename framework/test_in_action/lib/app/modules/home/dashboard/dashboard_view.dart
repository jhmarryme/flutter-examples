import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_logic.dart';

class DashboardView extends GetView<DashboardLogic> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<DashboardLogic>(() => DashboardLogic());
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardView - sub'),
      ),
      body: Center(
        child: GetBuilder<DashboardLogic>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('测试用', style: TextStyle(fontSize: 20)),
                Text('Time: ${controller.now.value.toString()}'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
      ),
    );
  }
}
