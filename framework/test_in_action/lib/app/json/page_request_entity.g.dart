import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/models/http/page_request_entity.dart';

PageRequestEntity $PageRequestEntityFromJson(Map<String, dynamic> json) {
  final PageRequestEntity pageRequestEntity = PageRequestEntity();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    pageRequestEntity.page = page;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    pageRequestEntity.size = size;
  }
  return pageRequestEntity;
}

Map<String, dynamic> $PageRequestEntityToJson(PageRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['size'] = entity.size;
  return data;
}

extension PageRequestEntityExtension on PageRequestEntity {
  PageRequestEntity copyWith({
    int? page,
    int? size,
  }) {
    return PageRequestEntity()
      ..page = page ?? this.page
      ..size = size ?? this.size;
  }
}
