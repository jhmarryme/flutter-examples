import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_store/widgets/card_main.dart';
import 'package:getx_store/widgets/side_drawer.dart';

import 'app_theme.dart';
import 'controllers/store_controller.dart';
import 'controllers/theme_controller.dart';

class Home extends GetView<StoreController> {
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Store'),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Column(
        children: [
          MainCard(
            title: 'Store Info',
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                        child: Text('Store Name:',
                            style: TextStyle(fontSize: 20))),
                    Expanded(
                        child: Obx(() => Text(
                              controller.storeName.value,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Store Followers:',
                        style: TextStyle(fontSize: 20)),
                    Column(children: [
                      const Text('With Obx'),
                      Obx(() => Text(
                            controller.followerCount.value.toString(),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ))
                    ]),
                    Column(children: [
                      const Text('With GetBuilder'),
                      GetBuilder<StoreController>(
                        builder: (storeController) => Text(
                          storeController.followerCount.value.toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )
                    ])
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                        child: Text('Status:', style: TextStyle(fontSize: 20))),
                    Expanded(
                        child: Obx(() => Text(
                            controller.storeStatus.value.toString(),
                            style: TextStyle(
                                color: controller.storeStatus.value
                                    ? Colors.green.shade700
                                    : Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold))))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          MainCard(
            title: "Followers",
            body: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.followerList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        controller.followerList[index].toString(),
                        style: const TextStyle(fontSize: 16),
                      ));
                },
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          MainCard(
            title: "Reviews",
            body: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.reviews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.reviews[index].name),
                    subtitle: Text(controller.reviews[index].review),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
