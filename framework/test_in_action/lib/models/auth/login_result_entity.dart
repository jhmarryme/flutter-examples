import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/login_result_entity.g.dart';

export 'package:test_in_action/app/json/login_result_entity.g.dart';

@JsonSerializable()
class LoginResultEntity {
  int? userId;
  String? token;

  LoginResultEntity();

  factory LoginResultEntity.fromJson(Map<String, dynamic> json) =>
      $LoginResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
