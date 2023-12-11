import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/login_request_entity.g.dart';

export 'package:test_in_action/app/json/login_request_entity.g.dart';

@JsonSerializable()
class LoginRequestEntity {
  late String username;
  late String password;

  LoginRequestEntity();

  factory LoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      $LoginRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
