import 'dart:convert';

import 'package:test_in_action/common/http/model/api_page_response_entity.g.dart';
import 'package:test_in_action/common/http/model/paging_data_entity.dart';

export 'package:test_in_action/common/http/model/api_page_response_entity.g.dart';

/// 用于接收分页响应, 参见 api_page_response_entity_test.dart
class ApiPageResponseEntity<T> {
  int? code;
  String? msg;
  PagingDataEntity<T>? data;

  ApiPageResponseEntity({this.code, this.msg, this.data});

  factory ApiPageResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ApiPageResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiPageResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
