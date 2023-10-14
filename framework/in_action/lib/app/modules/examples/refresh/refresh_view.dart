import 'package:flutter/material.dart';
import 'package:in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/sample_get_page_view.dart';

class RefreshView extends StatelessWidget {
  const RefreshView({super.key});

  @override
  Widget build(BuildContext context) {
    // final pageLogic = Get.find<SampleGetPageLogic>();
    // return CheckMarkIndicatorScreen();
    // return InfiniteScrollExample();
    // return FetchMoreIndicator(
    //   child: ExampleList(
    //     itemCount: 7,
    //     countElements: true,
    //   ),
    //   onAction: () => Future<void>.delayed(const Duration(seconds: 2)),
    // );
    // return MyRefreshWidget(child: ExampleList());
    // return MyEasyRefreshComponent();
    /// 测试用
    return const SampleGetPageView();
  }
}
