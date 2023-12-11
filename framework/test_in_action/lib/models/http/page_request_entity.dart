import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/page_request_entity.g.dart';

export 'package:test_in_action/app/json/page_request_entity.g.dart';

@JsonSerializable()
class PageRequestEntity {
  int page;
  int size = 20;

  PageRequestEntity({this.page = 1, this.size = 20});

  factory PageRequestEntity.fromJson(Map<String, dynamic> json) =>
      $PageRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $PageRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
