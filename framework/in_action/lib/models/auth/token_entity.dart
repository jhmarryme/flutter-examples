import 'dart:convert';

import 'package:in_action/app/json/base/json_field.dart';
import 'package:in_action/app/json/token_entity.g.dart';

export 'package:in_action/app/json/token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  @JSONField(name: "access_token")
  String? accessToken;
  @JSONField(name: "token_type")
  String? tokenType;
  @JSONField(name: "refresh_token")
  String? refreshToken;
  @JSONField(name: "expires_in")
  int? expiresIn;
  String? scope;

  TokenEntity();

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      $TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => $TokenEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
