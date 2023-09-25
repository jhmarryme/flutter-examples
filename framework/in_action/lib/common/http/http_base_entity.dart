import 'dart:convert';

/// code : "test"
/// message : "test"
/// data : "dynamic"

HttpBaseEntity httpBaseEntityFromJson(String str) =>
    HttpBaseEntity.fromJson(json.decode(str));

String httpBaseEntityToJson(HttpBaseEntity data) => json.encode(data.toJson());

class HttpBaseEntity<T> {
  HttpBaseEntity(
    this.code,
    this.message, {
    this.data,
  });

  HttpBaseEntity.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  String? code;
  String? message;
  T? data;

  HttpBaseEntity copyWith({
    String? code,
    String? message,
    T? data,
  }) =>
      HttpBaseEntity(
        code,
        message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
