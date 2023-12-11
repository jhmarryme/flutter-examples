import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/builder/easy_refresh_builder.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_base_logic.dart';
import 'package:test_in_action/utils/log_utils.dart';

class MyEasyRefresh<GetLogic extends RefreshOnStartBaseLogic>
    extends StatelessWidget {
  MyEasyRefresh({Key? key, required this.tag, required this.child})
      : super(key: key) {
    // 在构造函数中添加初始化逻辑
    print('MyEasyRefresh widget initialized.');
    // 这里可以添加其他你需要的代码
    getLogic.scrollController?.addListener(() {
      // todo 这里的判断逻辑还可以优化一下？？？
      if (getLogic.scrollController.position.pixels ==
          getLogic.scrollController.position.maxScrollExtent) {
        //  _controller.callLoad()加载无效[https://github.com/xuelongqy/flutter_easy_refresh/issues/683]
        // todo 解决底部footer不显示, 临时解决方案todo： 滚轮触发时，手动下显示loading
        if (_controller.footerState?.result != IndicatorResult.noMore) {
          LogUtil.d("滚轮触发加载更多......");
          getLogic.onLoadMore(_controller, refresh: RefreshStatus.wheelDown);
        }
      }
    });
  }

  final String tag;

  ///获取BaseGetPageLogic子类对象，在GetX中，任何BaseGetPageLogic都可以通过此方法获取
  ///但是必须是没有dispose的Controller
  GetLogic get getLogic => Get.find<GetLogic>(tag: tag);

  final Widget child;

  final EasyRefreshController _controller = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: EasyRefreshHeader.classicHeaderDefault(),
      footer: EasyRefreshFooter.classicFooterDefault(),
      child: child,
      onRefresh: () => getLogic.onLoadRefresh(_controller),
      onLoad: () => getLogic.onLoadMore(_controller),
    );
  }
}
