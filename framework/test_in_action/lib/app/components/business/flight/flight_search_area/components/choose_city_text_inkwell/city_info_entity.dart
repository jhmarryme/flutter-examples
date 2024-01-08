import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/city_info_entity.g.dart';

export 'package:test_in_action/app/json/city_info_entity.g.dart';

@JsonSerializable()
class CityInfoEntity {
  /// 国家区域
  String? region;

  /// 城市
  String? city;

  /// 省份
  String? province;

  /// 城市编码
  String? code;

  /// 城市id
  String? id;

  CityInfoEntity();

  factory CityInfoEntity.fromJson(Map<String, dynamic> json) =>
      $CityInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $CityInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
