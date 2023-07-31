import 'dart:convert';

/// icon : "https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg"
/// url : "https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004"
/// title : "活动"

CardInfo smallCardFromJson(String str) => CardInfo.fromJson(json.decode(str));
String smallCardToJson(CardInfo data) => json.encode(data.toJson());

class CardInfo {
  CardInfo({
    this.icon,
    this.url,
    this.title,
  });

  CardInfo.fromJson(dynamic json) {
    icon = json['icon'];
    url = json['url'];
    title = json['title'];
  }
  String? icon;
  String? url;
  String? title;
  CardInfo copyWith({
    String? icon,
    String? url,
    String? title,
  }) =>
      CardInfo(
        icon: icon ?? this.icon,
        url: url ?? this.url,
        title: title ?? this.title,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['url'] = url;
    map['title'] = title;
    return map;
  }
}
