import 'dart:convert';

HttpModel httpModelFromJson(String str) => HttpModel.fromJson(json.decode(str));

String httpModelToJson(HttpModel data) => json.encode(data.toJson());

class HttpModel {
  HttpModel({
    this.icon,
    this.title,
    this.url,
    this.statusBarColor,
    this.hideAppBar,
  });

  HttpModel.fromJson(dynamic json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  String? icon;
  String? title;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  HttpModel copyWith({
    String? icon,
    String? title,
    String? url,
    String? statusBarColor,
    bool? hideAppBar,
  }) =>
      HttpModel(
        icon: icon ?? this.icon,
        title: title ?? this.title,
        url: url ?? this.url,
        statusBarColor: statusBarColor ?? this.statusBarColor,
        hideAppBar: hideAppBar ?? this.hideAppBar,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    map['url'] = url;
    map['statusBarColor'] = statusBarColor;
    map['hideAppBar'] = hideAppBar;
    return map;
  }
}
