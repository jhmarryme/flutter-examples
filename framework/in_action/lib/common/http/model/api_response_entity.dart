import 'dart:convert';

import 'package:in_action/common/http/model/api_response_entity.g.dart';

export 'package:in_action/common/http/model/api_response_entity.g.dart';

class ApiResponseEntity<T> {
  int? code;
  String? msg;
  T? data;

  ApiResponseEntity({this.code, this.msg, this.data});

  factory ApiResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ApiResponseEntityFromJson<T>(json);

  Map<String, dynamic> toJson() => $ApiResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
