import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/test_user_entity.g.dart';

export 'package:test_in_action/app/json/test_user_entity.g.dart';

@JsonSerializable()
class TestUserEntity {
  String? id;
  String? name;
  int? age;

  TestUserEntity();

  factory TestUserEntity.fromJson(Map<String, dynamic> json) =>
      $TestUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $TestUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
