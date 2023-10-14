import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/common/http/model/api_page_response_entity.dart';

import 'paging_data_entity.dart';

ApiPageResponseEntity<T> $ApiPageResponseEntityFromJson<T>(
    Map<String, dynamic> json) {
  final ApiPageResponseEntity<T> apiPageResponseEntity =
      ApiPageResponseEntity<T>();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiPageResponseEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    apiPageResponseEntity.msg = msg;
  }
  if (json['data'] != null) {
    apiPageResponseEntity.data = PagingDataEntity.fromJson(json['data']);
  }
  return apiPageResponseEntity;
}

Map<String, dynamic> $ApiPageResponseEntityToJson(
    ApiPageResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  return data;
}

extension ApiPageResponseEntityExtension on ApiPageResponseEntity {
  ApiPageResponseEntity copyWith({
    int? code,
    String? msg,
    dynamic data,
  }) {
    return ApiPageResponseEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}
