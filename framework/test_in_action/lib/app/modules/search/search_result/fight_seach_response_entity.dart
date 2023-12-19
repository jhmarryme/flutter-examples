import 'dart:convert';

import 'package:test_in_action/app/json/base/json_field.dart';
import 'package:test_in_action/app/json/fight_seach_response_entity.g.dart';

export 'package:test_in_action/app/json/fight_seach_response_entity.g.dart';

@JsonSerializable()
class FightSearchResponseEntity {
  List<FightSearchResponseFlightDetailList>? list;

  String? additionalData;

  FightSearchResponseEntity();

  factory FightSearchResponseEntity.fromJson(Map<String, dynamic> json) =>
      $FightSearchResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $FightSearchResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class FightSearchResponseFlightDetailList {
  String? departureTime;
  String? arrivalTime;

  FightSearchResponseFlightDetailList();

  factory FightSearchResponseFlightDetailList.fromJson(
          Map<String, dynamic> json) =>
      $FightSearchResponseFlightDetailListFromJson(json);

  Map<String, dynamic> toJson() =>
      $FightSearchResponseFlightDetailListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
