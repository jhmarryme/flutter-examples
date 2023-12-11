import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/get/get_save_state_view.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_page.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'refresh_controller.dart';

class RefreshViewNew extends GetSaveView<RefreshController> {
  const RefreshViewNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 测试用
    return RefreshOnStartPage<RefreshController>(
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
    );
  }
}
