import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';
import 'package:test_in_action/models/http/page_request_entity.dart';

/// v1
abstract class RefreshOnStartBaseLogic<T> extends GetxController {
  // 当前页数
  int page = 1;

  // 每页数量
  int size = 20;

  // 数据列表
  List<T> dataList = [];

  // pageRequest
  final PageRequestEntity _pageRequest = PageRequestEntity();

  // scrollController 后续添加监听器使用
  get scrollController => null;

  get pageRequest {
    _pageRequest.page = page;
    _pageRequest.size = size;
    return _pageRequest;
  }

  /// 适用于后端请求结束后调用，由requestData方法调用
  onFinishRequestWithPagingEntity(EasyRefreshController controller,
      RefreshStatus refresh, PagingDataEntity<T>? entity) {
    List<T> values = entity?.records ?? [];
    bool over = calcIsLastPage(entity);
    onFinishRequest(controller, refresh, over, values);
  }

  /// 适用于后端请求结束后调用，由requestData方法调用
  onFinishRequest(EasyRefreshController controller, RefreshStatus refresh,
      bool over, List<T> values) {
    /// 下拉刷新需要清除列表
    if (refresh == RefreshStatus.pull || refresh == RefreshStatus.first) {
      dataList.clear();
    }
    dataList.addAll(values);
    onSuccess(controller, refresh, over);
  }

  /// 刷新加载成功
  /// [controller] EasyRefreshController
  /// [refresh] 加载类型 第一次、上拉、下拉
  /// [over] 是否为最后一页
  onSuccess(
      EasyRefreshController controller, RefreshStatus refresh, bool over) {
    /// 加载成功，重置刷新状态
    if (refresh == RefreshStatus.pull) {
      controller.finishRefresh();
      controller.resetFooter();
    }
    //todo 是否需要其他操作, 目前暂无
    else if (refresh == RefreshStatus.down) {}

    /// 最后一页了，无更多数据
    controller
        .finishLoad(over ? IndicatorResult.noMore : IndicatorResult.success);
    update();
  }

  /// 计算当前页是否是最后一页
  bool calcIsLastPage(PagingDataEntity<T>? entity) {
    int? size = entity?.size;
    int? total = entity?.total;
    int? current = entity?.current;
    if (size == null || total == null || current == null) {
      return true;
    }
    double pages = total / size;
    return current >= pages.ceil();
  }

  /// 适用于第一次进入，或下拉刷新操作
  /// 由RefreshOnStartPage组件调用，开发者无需关心
  onLoadRefresh(EasyRefreshController controller) {
    page = 1;
    requestData(controller, refreshStatus: RefreshStatus.pull);
  }

  /// 适用于下拉加载更多
  /// 由RefreshOnStartPage组件调用，开发者无需关心
  onLoadMore(EasyRefreshController controller,
      {RefreshStatus refresh = RefreshStatus.down}) {
    ++page;
    requestData(controller, refreshStatus: refresh);
  }

  /// 由子类在该方法中实现调用后端请求
  /// 请求完成后需要手动调用onFinishRequest或onFinishRequestWithPagingEntity
  void requestData(EasyRefreshController controller,
      {RefreshStatus refreshStatus = RefreshStatus.first}) {}
}

enum RefreshStatus {
  ///初次进入页面加载
  first,

  ///上拉加载
  pull,

  ///下拉加载
  down,

  /// 滚轮触发下拉加载
  wheelDown,
}
