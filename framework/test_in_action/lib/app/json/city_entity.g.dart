import 'package:test_in_action/app/dao/search/city_entity.dart';
import 'package:test_in_action/app/json/base/json_convert_content.dart';

CityEntity $CityEntityFromJson(Map<String, dynamic> json) {
  final CityEntity cityEntity = CityEntity();
  final String? region = jsonConvert.convert<String>(json['region']);
  if (region != null) {
    cityEntity.region = region;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    cityEntity.city = city;
  }
  final String? province = jsonConvert.convert<String>(json['province']);
  if (province != null) {
    cityEntity.province = province;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    cityEntity.code = code;
  }
  return cityEntity;
}

Map<String, dynamic> $CityEntityToJson(CityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['region'] = entity.region;
  data['city'] = entity.city;
  data['province'] = entity.province;
  data['code'] = entity.code;
  return data;
}

extension CityEntityExtension on CityEntity {
  CityEntity copyWith({
    String? region,
    String? city,
    String? province,
    String? code,
  }) {
    return CityEntity()
      ..region = region ?? this.region
      ..city = city ?? this.city
      ..province = province ?? this.province
      ..code = code ?? this.code;
  }
}
