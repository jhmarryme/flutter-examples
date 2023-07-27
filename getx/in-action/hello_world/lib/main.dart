import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/hello_world_controller.dart';
import 'package:hello_world/other.dart';

/// GetX的计数器示例
/// doc: https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  在你的MaterialApp前添加 "Get"，将其变成GetMaterialApp。
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // 使用Get.put()实例化你的类，使其对当下的所有子路由可用
  final controller = Get.put(HelloWorldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 使用Obx(()=>每当改变计数时，就更新Text()
        title: Obx(() => Text('Clicks: ${controller.count}')),
      ),
      body: Center(
        child: ElevatedButton(
          // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文
          onPressed: () => Get.to(Other()),
          child: const Text("Go to Other"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
