import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_base_logic.dart';
import 'package:test_in_action/common/http/http.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';
import 'package:test_in_action/utils/log_utils.dart';

class FooRefreshLogic extends RefreshOnStartBaseLogic<FooUserEntity> {
  final ScrollController _scrollController = ScrollController();

  /// 重写
  @override
  get scrollController => _scrollController;

  static get tag => "foo refresh logic - 1";

  @override
  void requestData(EasyRefreshController controller,
      {RefreshStatus refreshStatus = RefreshStatus.first}) {
    // 分页请求
    RequestHelper.requestPageNetwork<FooUserEntity>(
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/order/order",
      Method.post,
      // queryParameters: params,
      params: pageRequest.toJson(),
      showLoading: refreshStatus == RefreshStatus.wheelDown,
      onSuccess: (data) {
        onFinishRequestWithPagingEntity(controller, refreshStatus, data);
      },
      onError: (code, msg) {
        LogUtil.d("code: $code, msg: $msg");
      },
    );
  }
}
