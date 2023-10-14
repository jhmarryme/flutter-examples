import 'dart:convert';

import 'package:in_action/app/json/base/json_field.dart';
import 'package:in_action/app/json/request_body_entity.g.dart';

export 'package:in_action/app/json/request_body_entity.g.dart';

@JsonSerializable()
class RequestBodyEntity {
  String? keyword;

  RequestBodyEntity();

  factory RequestBodyEntity.fromJson(Map<String, dynamic> json) =>
      $RequestBodyEntityFromJson(json);

  Map<String, dynamic> toJson() => $RequestBodyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
