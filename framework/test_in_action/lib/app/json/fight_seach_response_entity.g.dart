import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/app/modules/search/search_result/fight_seach_response_entity.dart';

FightSearchResponseEntity $FightSearchResponseEntityFromJson(
    Map<String, dynamic> json) {
  final FightSearchResponseEntity fightSearchResponseEntity =
      FightSearchResponseEntity();
  final List<FightSearchResponseFlightDetailList>? list = (json['list']
          as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<FightSearchResponseFlightDetailList>(e)
          as FightSearchResponseFlightDetailList)
      .toList();
  if (list != null) {
    fightSearchResponseEntity.list = list;
  }
  final String? additionalData =
      jsonConvert.convert<String>(json['additionalData']);
  if (additionalData != null) {
    fightSearchResponseEntity.additionalData = additionalData;
  }
  return fightSearchResponseEntity;
}

Map<String, dynamic> $FightSearchResponseEntityToJson(
    FightSearchResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  data['additionalData'] = entity.additionalData;
  return data;
}

extension FightSearchResponseEntityExtension on FightSearchResponseEntity {
  FightSearchResponseEntity copyWith({
    List<FightSearchResponseFlightDetailList>? list,
    String? additionalData,
  }) {
    return FightSearchResponseEntity()
      ..list = list ?? this.list
      ..additionalData = additionalData ?? this.additionalData;
  }
}

FightSearchResponseFlightDetailList
    $FightSearchResponseFlightDetailListFromJson(Map<String, dynamic> json) {
  final FightSearchResponseFlightDetailList
      fightSearchResponseFlightDetailList =
      FightSearchResponseFlightDetailList();
  final String? departureTime =
      jsonConvert.convert<String>(json['departureTime']);
  if (departureTime != null) {
    fightSearchResponseFlightDetailList.departureTime = departureTime;
  }
  final String? arrivalTime = jsonConvert.convert<String>(json['arrivalTime']);
  if (arrivalTime != null) {
    fightSearchResponseFlightDetailList.arrivalTime = arrivalTime;
  }
  return fightSearchResponseFlightDetailList;
}

Map<String, dynamic> $FightSearchResponseFlightDetailListToJson(
    FightSearchResponseFlightDetailList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['departureTime'] = entity.departureTime;
  data['arrivalTime'] = entity.arrivalTime;
  return data;
}

extension FightSearchResponseFlightDetailListExtension
    on FightSearchResponseFlightDetailList {
  FightSearchResponseFlightDetailList copyWith({
    String? departureTime,
    String? arrivalTime,
  }) {
    return FightSearchResponseFlightDetailList()
      ..departureTime = departureTime ?? this.departureTime
      ..arrivalTime = arrivalTime ?? this.arrivalTime;
  }
}
