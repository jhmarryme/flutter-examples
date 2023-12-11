import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/get/get_save_state_view.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_page.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';

class SampleGetPageView extends GetSaveView<SampleGetPageLogic<QuizEntity>> {
  const SampleGetPageView({super.key});

  @override
  Widget build(BuildContext context) {
    /// 测试用
    return RefreshOnStartPage<SampleGetPageLogic<QuizEntity>>(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                QuizEntity data = controller.dataList[index];
                return const SkeletonItem();
              },
              childCount: controller.dataList.length,
            ),
          ),
        ],
      ),
    );
  }
}
