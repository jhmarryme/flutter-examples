import 'package:test_in_action/app/json/base/json_convert_content.dart';
import 'package:test_in_action/models/auth/token_entity.dart';

TokenEntity $TokenEntityFromJson(Map<String, dynamic> json) {
  final TokenEntity tokenEntity = TokenEntity();
  final String? accessToken = jsonConvert.convert<String>(json['access_token']);
  if (accessToken != null) {
    tokenEntity.accessToken = accessToken;
  }
  final String? tokenType = jsonConvert.convert<String>(json['token_type']);
  if (tokenType != null) {
    tokenEntity.tokenType = tokenType;
  }
  final String? refreshToken =
      jsonConvert.convert<String>(json['refresh_token']);
  if (refreshToken != null) {
    tokenEntity.refreshToken = refreshToken;
  }
  final int? expiresIn = jsonConvert.convert<int>(json['expires_in']);
  if (expiresIn != null) {
    tokenEntity.expiresIn = expiresIn;
  }
  final String? scope = jsonConvert.convert<String>(json['scope']);
  if (scope != null) {
    tokenEntity.scope = scope;
  }
  return tokenEntity;
}

Map<String, dynamic> $TokenEntityToJson(TokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['access_token'] = entity.accessToken;
  data['token_type'] = entity.tokenType;
  data['refresh_token'] = entity.refreshToken;
  data['expires_in'] = entity.expiresIn;
  data['scope'] = entity.scope;
  return data;
}

extension TokenEntityExtension on TokenEntity {
  TokenEntity copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
  }) {
    return TokenEntity()
      ..accessToken = accessToken ?? this.accessToken
      ..tokenType = tokenType ?? this.tokenType
      ..refreshToken = refreshToken ?? this.refreshToken
      ..expiresIn = expiresIn ?? this.expiresIn
      ..scope = scope ?? this.scope;
  }
}
