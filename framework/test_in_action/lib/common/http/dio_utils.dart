import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:test_in_action/common/http/model/api_page_response_entity.dart';
import 'package:test_in_action/common/http/model/api_response_entity.dart';
import 'package:test_in_action/utils/log_utils.dart';

import 'error_handle.dart';
import 'model/paging_data_entity.dart';

/// 默认dio配置
Duration _connectTimeout = const Duration(seconds: 15);
Duration _receiveTimeout = const Duration(seconds: 15);
Duration _sendTimeout = const Duration(seconds: 10);
String _baseUrl = '';
List<Interceptor> _interceptors = [];

/// 初始化Dio配置
void configDio({
  Duration? connectTimeout,
  Duration? receiveTimeout,
  Duration? sendTimeout,
  String? baseUrl,
  List<Interceptor>? interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetSuccessCallback<T> = Function(T? data);
typedef PageNetSuccessCallback<T> = Function(PagingDataEntity<T>? data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int? code, String? msg);

class DioUtils {
  factory DioUtils() => _singleton;

  DioUtils._() {
    final BaseOptions options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      validateStatus: (_) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: _baseUrl,
//      contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
    );
    _dio = Dio(options);

    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
    // _dio.httpClientAdapter = IOHttpClientAdapter()..onHttpClientCreate = (HttpClient client) {
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return 'PROXY 10.41.0.132:8888';
    //   };
    //   return client;
    // };

    /// 添加拦截器
    void addInterceptor(Interceptor interceptor) {
      _dio.interceptors.add(interceptor);
    }

    _interceptors.forEach(addInterceptor);
  }

  static final DioUtils _singleton = DioUtils._();

  static DioUtils get instance => DioUtils();

  static late Dio _dio;

  Dio get dio => _dio;
  Options _checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  // 数据返回格式统一，统一处理异常
  Future<ApiResponseEntity<T>> _request<T>(
    String method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response response = await _dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      return ApiResponseEntity<T>.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return ApiResponseEntity(
          code: ExceptionHandle.parse_error, msg: "数据解析错误");
    }
  }

  // 数据返回格式统一，统一处理异常
  Future<ApiPageResponseEntity<T>> _requestPage<T>(
    String method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response response = await _dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      await Future.delayed(const Duration(seconds: 1));
      return ApiPageResponseEntity<T>.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      return ApiPageResponseEntity(
          code: ExceptionHandle.parse_error, msg: "数据解析错误");
    }
  }

  Future<dynamic> requestNetwork<T>(
    Method method,
    String url, {
    NetSuccessCallback<T>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return _request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then((ApiResponseEntity<T> result) {
      if (result.code == 200) {
        onSuccess?.call(result.data);
      } else {
        _onError(result.code, result.msg, onError);
      }
      return result.data;
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  Future<dynamic> requestPageNetwork<T>(
    Method method,
    String url, {
    PageNetSuccessCallback<T>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return _requestPage<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then((ApiPageResponseEntity<T> result) {
      if (result.code == 200) {
        onSuccess?.call(result.data);
      } else {
        _onError(result.code, result.msg, onError);
      }
      return result.data;
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  /// 统一处理(onSuccess返回T对象，onSuccessList返回 List<T>)
  void asyncRequestNetwork<T>(
    Method method,
    String url, {
    NetSuccessCallback<T?>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    Stream.fromFuture(_request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream().listen((result) {
      if (result.code == 0) {
        if (onSuccess != null) {
          // onSuccess(result.data);
        }
      } else {
        // _onError(result.code, result.message, onError);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioException && CancelToken.isCancel(e)) {
      LogUtil.e('取消请求接口： $url');
    }
  }

  void _onError(int? code, String? msg, NetErrorCallback? onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    LogUtil.e('接口请求异常： code: $code, mag: $msg');
    onError?.call(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, put, patch, delete, head }

/// 使用拓展枚举替代 switch判断取值
/// https://zhuanlan.zhihu.com/p/98545689
extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
