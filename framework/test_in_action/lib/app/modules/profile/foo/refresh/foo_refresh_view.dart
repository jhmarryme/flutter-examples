import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_page.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'foo_refresh_logic.dart';

class FooRefreshView extends GetBuilderView<FooRefreshLogic> {
  const FooRefreshView({Key? key}) : super(key: key);

  @override
  get tag => FooRefreshLogic.tag;

  @override
  void beforeBuild() {
    Get.lazyPut<FooRefreshLogic>(() => FooRefreshLogic(),
        tag: FooRefreshLogic.tag);
  }

  @override
  Widget doBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshOnStartPage<FooRefreshLogic>(
        tag: FooRefreshLogic.tag,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final data = controller.dataList[index];
                  LogUtil.d(data.toString());
                  return SkeletonItem(index: int.parse(data.id ?? '0'));
                },
                childCount: controller.dataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
