import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_base_logic.dart';
import 'package:test_in_action/utils/log_utils.dart';

class RefreshOnStartPage<Logic extends RefreshOnStartBaseLogic>
    extends StatefulWidget {
  const RefreshOnStartPage({super.key, required this.tag, required this.child});

  final String tag;

  final Widget? child;

  ///获取BaseGetPageLogic子类对象，在GetX中，任何BaseGetPageLogic都可以通过此方法获取
  ///但是必须是没有dispose的Controller
  Logic get getLogic => Get.find<Logic>(tag: tag);

  @override
  State<RefreshOnStartPage> createState() => _RefreshOnStartPageState();
}

class _RefreshOnStartPageState extends State<RefreshOnStartPage> {
  late EasyRefreshController _easyRefreshController;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    widget.getLogic.scrollController?.addListener(() {
      // todo 这里的判断逻辑还可以优化一下？？？
      if (widget.getLogic.scrollController.position.pixels ==
          widget.getLogic.scrollController.position.maxScrollExtent) {
        //  _controller.callLoad()加载无效[https://github.com/xuelongqy/flutter_easy_refresh/issues/683]
        // todo 解决底部footer不显示, 临时解决方案todo： 滚轮触发时，手动下显示loading
        if (_easyRefreshController.footerState?.result !=
            IndicatorResult.noMore) {
          LogUtil.d("滚轮触发加载更多......");
          widget.getLogic.onLoadMore(_easyRefreshController,
              refresh: RefreshStatus.wheelDown);
        }
      }
    });
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return EasyRefresh(
      scrollController: widget.getLogic.scrollController,
      controller: _easyRefreshController,
      refreshOnStart: true,
      refreshOnStartHeader: BuilderHeader(
        triggerOffset: 70,
        clamping: true,
        position: IndicatorPosition.above,
        processedDuration: Duration.zero,
        builder: (ctx, state) {
          if (state.mode == IndicatorMode.inactive ||
              state.mode == IndicatorMode.done) {
            return const SizedBox();
          }
          return Container(
            padding: const EdgeInsets.only(bottom: 100),
            width: double.infinity,
            height: state.viewportDimension,
            alignment: Alignment.center,
            child: SpinKitFadingCube(
              size: 24,
              color: themeData.colorScheme.primary,
            ),
          );
        },
      ),
      onRefresh: () => widget.getLogic.onLoadRefresh(_easyRefreshController),
      onLoad: () => widget.getLogic.onLoadMore(_easyRefreshController),
      child: widget.child,
    );
  }
}
