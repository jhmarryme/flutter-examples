import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/refresh_on_start_base_logic.dart';
import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/request_helper.dart';
import 'package:test_in_action/services/auth_service.dart';

class SampleGetPageLogic<T> extends RefreshOnStartBaseLogic {
  ScrollController controller = ScrollController();

  /// 重写
  @override
  get scrollController => controller;

  @override
  void requestData(EasyRefreshController controller,
      {RefreshStatus refreshStatus = RefreshStatus.first}) {
    final Map<String, String> params = <String, String>{};
    params['keyword'] = "思想";
    params['token'] = AuthService.to.state.token.value;
    // RequestHelper.requestNetwork<List<T>>(
    //   Method.post,
    //   queryParameters: params,
    //   // params: FormData.fromMap(params),
    //   showLoading: refresh == RefreshStatus.wheelDown,
    //   onSuccess: (data) {
    //     onFinishRequest(controller, refresh, true, data ?? []);
    //     update();
    //   },
    //   onError: (code, HomeLogic) {
    //     print("code: $code, msg: $msg");
    //   },
    //   url: "quiz/list-form",
    // );

    // 分页请求
    RequestHelper.requestPageNetwork<T>(
      Method.post,
      // queryParameters: params,
      params: params,
      showLoading: refreshStatus == RefreshStatus.wheelDown,
      onSuccess: (data) {
        onFinishRequest(controller, refreshStatus, true, data?.records ?? []);
        update();
      },
      onError: (code, msg) {
        print("code: $code, msg: $msg");
      },
      url: "/quiz/list-form-page",
    );
  }
}
