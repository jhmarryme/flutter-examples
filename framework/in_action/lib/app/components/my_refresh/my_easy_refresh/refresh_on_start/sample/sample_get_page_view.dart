import 'package:flutter/material.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/RefreshOnStartPage.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_logic.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/skeleton_item.dart';
import 'package:in_action/common/get/get_save_state_view.dart';

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
                QuizEntity data = controller.projectData[index];
                return const SkeletonItem();
              },
              childCount: controller.projectData.length,
            ),
          ),
        ],
      ),
    );
  }
}
