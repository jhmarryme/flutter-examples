import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/city_entity.g.dart';

export 'package:test_in_action/app/json/city_entity.g.dart';

@JsonSerializable()
class CityEntity {
  String? region;
  String? city;
  String? province;
  String? code;

  CityEntity();

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      $CityEntityFromJson(json);

  Map<String, dynamic> toJson() => $CityEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
