import 'dart:convert';

/// userId : 123
/// token : "testtoken"

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));
String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.userId,
    this.token,
  });

  UserLogin.fromJson(dynamic json) {
    userId = json['userId'];
    token = json['token'];
  }
  int? userId;
  String? token;
  UserLogin copyWith({
    int? userId,
    String? token,
  }) =>
      UserLogin(
        userId: userId ?? this.userId,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['token'] = token;
    return map;
  }
}
