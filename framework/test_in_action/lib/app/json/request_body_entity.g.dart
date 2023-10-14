import 'package:test_in_action/app/components/my_refresh/my_easy_refresh/refresh_on_start/sample/request_body_entity.dart';
import 'package:test_in_action/app/json/base/json_convert_content.dart';

RequestBodyEntity $RequestBodyEntityFromJson(Map<String, dynamic> json) {
  final RequestBodyEntity requestBodyEntity = RequestBodyEntity();
  final String? keyword = jsonConvert.convert<String>(json['keyword']);
  if (keyword != null) {
    requestBodyEntity.keyword = keyword;
  }
  return requestBodyEntity;
}

Map<String, dynamic> $RequestBodyEntityToJson(RequestBodyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['keyword'] = entity.keyword;
  return data;
}

extension RequestBodyEntityExtension on RequestBodyEntity {
  RequestBodyEntity copyWith({
    String? keyword,
  }) {
    return RequestBodyEntity()..keyword = keyword ?? this.keyword;
  }
}
