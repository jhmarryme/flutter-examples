// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/quiz_entity.dart';
import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/request_body_entity.dart';
import 'package:test_in_action/common/http/model/order_item_entity.dart';
import 'package:test_in_action/models/auth/login_request_entity.dart';
import 'package:test_in_action/models/auth/login_result_entity.dart';
import 'package:test_in_action/models/auth/token_entity.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';
import 'package:test_in_action/models/http/page_request_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(
    Object error, StackTrace stackTrace);

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>)
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!)
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<QuizEntity>[] is M) {
      return data
          .map<QuizEntity>((Map<String, dynamic> e) => QuizEntity.fromJson(e))
          .toList() as M;
    }
    if (<QuizOptions>[] is M) {
      return data
          .map<QuizOptions>((Map<String, dynamic> e) => QuizOptions.fromJson(e))
          .toList() as M;
    }
    if (<RequestBodyEntity>[] is M) {
      return data
          .map<RequestBodyEntity>(
              (Map<String, dynamic> e) => RequestBodyEntity.fromJson(e))
          .toList() as M;
    }
    if (<OrderItemEntity>[] is M) {
      return data
          .map<OrderItemEntity>(
              (Map<String, dynamic> e) => OrderItemEntity.fromJson(e))
          .toList() as M;
    }
    if (<LoginRequestEntity>[] is M) {
      return data
          .map<LoginRequestEntity>(
              (Map<String, dynamic> e) => LoginRequestEntity.fromJson(e))
          .toList() as M;
    }
    if (<LoginResultEntity>[] is M) {
      return data
          .map<LoginResultEntity>(
              (Map<String, dynamic> e) => LoginResultEntity.fromJson(e))
          .toList() as M;
    }
    if (<TokenEntity>[] is M) {
      return data
          .map<TokenEntity>((Map<String, dynamic> e) => TokenEntity.fromJson(e))
          .toList() as M;
    }
    if (<FooUserEntity>[] is M) {
      return data
          .map<FooUserEntity>(
              (Map<String, dynamic> e) => FooUserEntity.fromJson(e))
          .toList() as M;
    }
    if (<PageRequestEntity>[] is M) {
      return data
          .map<PageRequestEntity>(
              (Map<String, dynamic> e) => PageRequestEntity.fromJson(e))
          .toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (QuizEntity).toString(): QuizEntity.fromJson,
    (QuizOptions).toString(): QuizOptions.fromJson,
    (RequestBodyEntity).toString(): RequestBodyEntity.fromJson,
    (OrderItemEntity).toString(): OrderItemEntity.fromJson,
    (LoginRequestEntity).toString(): LoginRequestEntity.fromJson,
    (LoginResultEntity).toString(): LoginResultEntity.fromJson,
    (TokenEntity).toString(): TokenEntity.fromJson,
    (FooUserEntity).toString(): FooUserEntity.fromJson,
    (PageRequestEntity).toString(): PageRequestEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}
