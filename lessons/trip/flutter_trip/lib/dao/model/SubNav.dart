import 'dart:convert';

/// icon : "https://www.devio.org/io/flutter_app/img/sub_nav_wifi.png"
/// title : "WiFi电话卡"
/// url : "https://m.ctrip.com/webapp/activity/wifi"
/// hideAppBar : true

SubNav subNavListFromJson(String str) => SubNav.fromJson(json.decode(str));
String subNavListToJson(SubNav data) => json.encode(data.toJson());

class SubNav {
  SubNav({
    this.icon,
    this.title,
    this.url,
    this.hideAppBar,
  });

  SubNav.fromJson(dynamic json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }
  String? icon;
  String? title;
  String? url;
  bool? hideAppBar;
  SubNav copyWith({
    String? icon,
    String? title,
    String? url,
    bool? hideAppBar,
  }) =>
      SubNav(
        icon: icon ?? this.icon,
        title: title ?? this.title,
        url: url ?? this.url,
        hideAppBar: hideAppBar ?? this.hideAppBar,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['title'] = title;
    map['url'] = url;
    map['hideAppBar'] = hideAppBar;
    return map;
  }
}
