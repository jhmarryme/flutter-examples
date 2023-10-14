import 'package:in_action/app/json/base/json_convert_content.dart';
import 'package:in_action/common/http/model/api_response_entity.dart';

ApiResponseEntity<T> $ApiResponseEntityFromJson<T>(Map<String, dynamic> json) {
  final ApiResponseEntity<T> apiResponseEntity = ApiResponseEntity<T>();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    apiResponseEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    apiResponseEntity.msg = msg;
  }
  final T? data = JsonConvert.fromJsonAsT<T>(json['data']);
  if (data != null) {
    apiResponseEntity.data = data;
  }
  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseEntityToJson(ApiResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data;
  return data;
}

extension ApiResponseEntityExtension on ApiResponseEntity {
  ApiResponseEntity copyWith({
    int? code,
    String? msg,
    dynamic data,
  }) {
    return ApiResponseEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}
