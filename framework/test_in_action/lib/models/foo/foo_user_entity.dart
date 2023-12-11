import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/foo_user_entity.g.dart';

export 'package:test_in_action/app/json/foo_user_entity.g.dart';

@JsonSerializable()
class FooUserEntity {
  String? id;
  String? name;
  int? age;

  FooUserEntity();

  factory FooUserEntity.fromJson(Map<String, dynamic> json) =>
      $FooUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $FooUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
