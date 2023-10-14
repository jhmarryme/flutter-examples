import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/widget/refresh_status.dart';

class BaseGetPageLogic<T> extends GetxController {
  // 当前页数
  int page = 1;

  // todo 这里是否可以放 分页响应[PagingDataEntity]?
  List<T> projectData = [];

  // scrollController 后续添加监听器使用
  get scrollController => null;

  onLoadRefresh(EasyRefreshController controller) {
    page = 1;
    requestData(controller, refresh: RefreshStatus.pull);
  }

  onLoadMore(EasyRefreshController controller,
      {RefreshStatus refresh = RefreshStatus.down}) {
    ++page;
    requestData(controller, refresh: refresh);
  }

  onFinishRequest(EasyRefreshController controller, RefreshStatus refresh,
      bool over, List<T> values) {
    /// 下拉刷新需要清除列表
    if (refresh != RefreshStatus.down) {
      projectData.clear();
    }
    projectData.addAll(values);
    onSuccess(controller, refresh, over);
  }

  ///刷新加载成功
  ///[controller] EasyRefreshController
  ///[refresh] 加载类型 第一次、上拉、下拉
  ///[over] 是否为最后一页
  onSuccess(
      EasyRefreshController controller, RefreshStatus refresh, bool over) {
    ///加载成功，重置刷新状态
    if (refresh == RefreshStatus.pull) {
      controller.finishRefresh();
      controller.resetFooter();
    }
    //todo 是否需要其他操作
    else if (refresh == RefreshStatus.down) {}

    ///最后一页了，无更多数据
    controller
        .finishLoad(over ? IndicatorResult.noMore : IndicatorResult.success);
  }

  void requestData(EasyRefreshController controller,
      {RefreshStatus refresh = RefreshStatus.first}) {}
}
