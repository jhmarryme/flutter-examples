import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/models/foo/foo_user_entity.dart';

FooUserEntity $FooUserEntityFromJson(Map<String, dynamic> json) {
  final FooUserEntity fooUserEntity = FooUserEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    fooUserEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    fooUserEntity.name = name;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    fooUserEntity.age = age;
  }
  return fooUserEntity;
}

Map<String, dynamic> $FooUserEntityToJson(FooUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['age'] = entity.age;
  return data;
}

extension FooUserEntityExtension on FooUserEntity {
  FooUserEntity copyWith({
    String? id,
    String? name,
    int? age,
  }) {
    return FooUserEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..age = age ?? this.age;
  }
}
