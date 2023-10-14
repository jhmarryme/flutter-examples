import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/common/foo/test_user_entity.dart';

TestUserEntity $TestUserEntityFromJson(Map<String, dynamic> json) {
  final TestUserEntity testUserEntity = TestUserEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    testUserEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    testUserEntity.name = name;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    testUserEntity.age = age;
  }
  return testUserEntity;
}

Map<String, dynamic> $TestUserEntityToJson(TestUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['age'] = entity.age;
  return data;
}

extension TestUserEntityExtension on TestUserEntity {
  TestUserEntity copyWith({
    String? id,
    String? name,
    int? age,
  }) {
    return TestUserEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..age = age ?? this.age;
  }
}
