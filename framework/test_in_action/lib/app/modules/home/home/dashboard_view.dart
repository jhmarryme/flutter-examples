import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/routes/router_define.dart';

import 'dashboard_logic.dart';

class HomeView extends GetView<HomeLogic> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    return Scaffold(
      appBar: AppBar(title: Text("section A root")),
      body: Center(
        child: GetBuilder<HomeLogic>(
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
        onPressed: () =>
            GoRouter.of(context).goNamed(HomeRouterDefine.dashboard.name),
        child: Text("to dashboard"),
      ),
    );
  }
}
