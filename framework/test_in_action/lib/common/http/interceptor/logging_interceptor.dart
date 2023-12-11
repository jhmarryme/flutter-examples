import 'package:dio/dio.dart';
import 'package:test_in_action/common/http/error_handle.dart';
import 'package:test_in_action/utils/log_utils.dart';

abstract class LoggingInterceptor extends Interceptor {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    LogUtil.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LogUtil.d('RequestUrl: ${options.baseUrl}-----${options.path}');
    } else {
      LogUtil.d(
          'RequestUrl: ${options.baseUrl}-----${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    LogUtil.d('RequestMethod: ${options.method}');
    LogUtil.d('RequestHeaders:${options.headers}');
    LogUtil.d('RequestContentType: ${options.contentType}');
    LogUtil.d('RequestData: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      LogUtil.d('ResponseCode: ${response.statusCode}');
    } else {
      LogUtil.e('ResponseCode: ${response.statusCode}');
    }
    // 输出结果
    LogUtil.d(response.data.toString());
    LogUtil.d('----------End: $duration 毫秒----------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LogUtil.d('----------Error-----------');
    super.onError(err, handler);
  }
}
