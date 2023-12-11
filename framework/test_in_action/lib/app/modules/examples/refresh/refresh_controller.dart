import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_base_logic.dart';
import 'package:test_in_action/common/http/http.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';

class RefreshController extends RefreshOnStartBaseLogic<FooUserEntity> {
  final now = DateTime.now().obs;
  ScrollController controller = ScrollController();

  /// 重写
  @override
  get scrollController => controller;

  @override
  void requestData(EasyRefreshController controller,
      {RefreshStatus refreshStatus = RefreshStatus.first}) {
    final Map<String, dynamic> params = <String, dynamic>{};
    params['size'] = page;
    // 分页请求
    RequestHelper.requestPageNetwork<FooUserEntity>(
      Method.post,
      // queryParameters: params,
      params: params,
      showLoading: refreshStatus == RefreshStatus.wheelDown,
      onSuccess: (data) {
        bool over = calcIsLastPage(data);
        onFinishRequest(controller, refreshStatus, over, data?.records ?? []);
        update();
      },
      onError: (code, msg) {
        print("code: $code, msg: $msg");
      },
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/order/order",
    );
  }

  bool calcIsLastPage(PagingDataEntity<dynamic>? entity) {
    int? size = entity?.size;
    int? total = entity?.total;
    int? current = entity?.current;
    if (size == null || total == null || current == null) {
      return true;
    }
    double pages = total / size;
    return current >= pages.ceil();
  }
}
