import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/paging/custom_paging.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';

class MyEasyRefreshComponent extends StatefulWidget {
  MyEasyRefreshComponent({super.key});

  @override
  State<MyEasyRefreshComponent> createState() => _MyEasyRefreshComponentState();
}

class _MyEasyRefreshComponentState extends State<MyEasyRefreshComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paging example'.tr),
      ),
      body: CustomPaging(
        refreshOnStart: true,
        itemBuilder: <ItemType>(context, index, item) {
          return const SkeletonItem();
        },
      ),
    );
  }
}
