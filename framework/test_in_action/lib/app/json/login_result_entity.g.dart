import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/models/auth/login_result_entity.dart';

LoginResultEntity $LoginResultEntityFromJson(Map<String, dynamic> json) {
  final LoginResultEntity loginResultEntity = LoginResultEntity();
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    loginResultEntity.userId = userId;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginResultEntity.token = token;
  }
  return loginResultEntity;
}

Map<String, dynamic> $LoginResultEntityToJson(LoginResultEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['token'] = entity.token;
  return data;
}

extension LoginResultEntityExtension on LoginResultEntity {
  LoginResultEntity copyWith({
    int? userId,
    String? token,
  }) {
    return LoginResultEntity()
      ..userId = userId ?? this.userId
      ..token = token ?? this.token;
  }
}
