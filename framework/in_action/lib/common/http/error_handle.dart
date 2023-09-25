import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ExceptionHandle {
  static const String success = "200";
  static const String success_not_content = "204";
  static const String not_modified = "304";
  static const String unauthorized = "401";
  static const String forbidden = "403";
  static const String not_found = "404";

  static const String net_error = "1000";
  static const String parse_error = "1001";
  static const String socket_error = "1002";
  static const String http_error = "1003";
  static const String connect_timeout_error = "1004";
  static const String send_timeout_error = "1005";
  static const String receive_timeout_error = "1006";
  static const String cancel_error = "1007";
  static const String unknown_error = "9999";

  static final Map<String, NetError> _errorMap = <String, NetError>{
    net_error: NetError(net_error, '网络异常，请检查你的网络！'),
    parse_error: NetError(parse_error, '数据解析错误！'),
    socket_error: NetError(socket_error, '网络异常，请检查你的网络！'),
    http_error: NetError(http_error, '服务器异常，请稍后重试！'),
    connect_timeout_error: NetError(connect_timeout_error, '连接超时！'),
    send_timeout_error: NetError(send_timeout_error, '请求超时！'),
    receive_timeout_error: NetError(receive_timeout_error, '响应超时！'),
    cancel_error: NetError(cancel_error, '取消请求'),
    unknown_error: NetError(unknown_error, '未知异常'),
  };

  static NetError handleException(dynamic error) {
    debugPrint(error.toString());
    if (error is DioException) {
      if (error.type.errorCode == 0) {
        return _handleException(error.error);
      } else {
        return _errorMap[error.type.errorCode]!;
      }
    } else {
      return _handleException(error);
    }
  }

  static NetError _handleException(dynamic error) {
    String errorCode = unknown_error;
    if (error is SocketException) {
      errorCode = socket_error;
    }
    if (error is HttpException) {
      errorCode = http_error;
    }
    if (error is FormatException) {
      errorCode = parse_error;
    }
    return _errorMap[errorCode]!;
  }
}

class NetError {
  NetError(this.code, this.msg);

  String code;
  String msg;
}

extension DioErrorTypeExtension on DioExceptionType {
  String get errorCode => [
        ExceptionHandle.connect_timeout_error,
        ExceptionHandle.send_timeout_error,
        ExceptionHandle.receive_timeout_error,
        "0",
        "0",
        ExceptionHandle.cancel_error,
        "0",
        ExceptionHandle.unknown_error,
      ][index];
}
