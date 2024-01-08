import 'package:test_in_action/app/components/business/flight/flight_search_area/components/choose_city_text_inkwell/city_info_entity.dart';
import 'package:test_in_action/app/json/base/json_convert_content.dart';

CityInfoEntity $CityInfoEntityFromJson(Map<String, dynamic> json) {
  final CityInfoEntity cityInfoEntity = CityInfoEntity();
  final String? region = jsonConvert.convert<String>(json['region']);
  if (region != null) {
    cityInfoEntity.region = region;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    cityInfoEntity.city = city;
  }
  final String? province = jsonConvert.convert<String>(json['province']);
  if (province != null) {
    cityInfoEntity.province = province;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    cityInfoEntity.code = code;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cityInfoEntity.id = id;
  }
  return cityInfoEntity;
}

Map<String, dynamic> $CityInfoEntityToJson(CityInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['region'] = entity.region;
  data['city'] = entity.city;
  data['province'] = entity.province;
  data['code'] = entity.code;
  data['id'] = entity.id;
  return data;
}

extension CityInfoEntityExtension on CityInfoEntity {
  CityInfoEntity copyWith({
    String? region,
    String? city,
    String? province,
    String? code,
    String? id,
  }) {
    return CityInfoEntity()
      ..region = region ?? this.region
      ..city = city ?? this.city
      ..province = province ?? this.province
      ..code = code ?? this.code
      ..id = id ?? this.id;
  }
}
