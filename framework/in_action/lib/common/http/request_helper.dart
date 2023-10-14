import 'package:dio/dio.dart';
import 'package:in_action/utils/tips_util.dart';

import 'http.dart';

class RequestHelper {
  /// 返回Future 适用于刷新，加载更多
  static Future<dynamic> requestNetwork<T>(
    Method method, {
    required String url,
    bool showLoading = true,
    NetSuccessCallback<T?>? onSuccess,
    NetErrorCallback? onError,
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    if (showLoading) {
      TipsUtil.showLoading();
    }
    return DioUtils.instance.requestNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSuccess: (data) {
        if (showLoading) {
          TipsUtil.dismiss();
        }
        onSuccess?.call(data);
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  /// 返回Future 适用于刷新，加载更多
  static Future<dynamic> requestPageNetwork<T>(
    Method method, {
    required String url,
    bool showLoading = true,
    PageNetSuccessCallback<T>? onSuccess,
    NetErrorCallback? onError,
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    if (showLoading) {
      TipsUtil.showLoading();
    }
    return DioUtils.instance.requestPageNetwork<T>(
      method,
      url,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSuccess: (data) {
        if (showLoading) {
          TipsUtil.dismiss();
        }
        onSuccess?.call(data);
      },
      onError: (code, msg) {
        _onError(code, msg, onError);
      },
    );
  }

  static void _onError(int? code, String? msg, NetErrorCallback? onError) {
    /// 异常时直接关闭加载圈，不受isClose影响
    TipsUtil.dismiss();
    if (code != ExceptionHandle.cancel_error) {
      TipsUtil.showToast(msg ?? 'unknown error');
    }

    /// 页面如果dispose，则不回调onError
    if (onError != null) {
      onError(code, msg);
    }
  }
}
