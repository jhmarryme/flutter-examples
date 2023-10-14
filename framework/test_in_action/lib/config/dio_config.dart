import 'package:dio/dio.dart';
import 'package:test_in_action/app/interceptor/interceptor.dart';
import 'package:test_in_action/common/http/http.dart';

void initDio() {
  final List<Interceptor> interceptors = <Interceptor>[];

  /// 统一添加身份验证请求头
  interceptors.add(DefaultAuthInterceptor());

  /// 刷新Token
  interceptors.add(DefaultTokenInterceptor());

  /// 打印Log(生产模式去除)
  // if (!Constant.inProduction) {
  interceptors.add(DefaultLoggingInterceptor());
  // }

  /// 适配数据(根据自己的数据结构，可自行选择添加)
  // interceptors.add(AdapterInterceptor());
  configDio(
    baseUrl: 'http://localhost:7777/',
    interceptors: interceptors,
  );
}
