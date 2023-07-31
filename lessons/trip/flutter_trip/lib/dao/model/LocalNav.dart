import 'dart:convert';

/// icon : "https://www.devio.org/io/flutter_app/img/ln_ticket.png"
/// title : "攻略·景点"
/// url : "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
/// statusBarColor : "1070b8"
/// hideAppBar : true

LocalNav localNavListFromJson(String str) =>
    LocalNav.fromJson(json.decode(str));

String localNavListToJson(LocalNav data) => json.encode(data.toJson());

class LocalNav {
  LocalNav({
    required this.icon,
    required this.title,
    required this.url,
    this.statusBarColor,
    this.hideAppBar,
  });

  LocalNav.fromJson(dynamic json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  late String icon;
  late String title;
  late String url;
  String? statusBarColor;
  bool? hideAppBar;

  LocalNav copyWith({
    String? icon,
    String? title,
    String? url,
    String? statusBarColor,
    bool? hideAppBar,
  }) =>
      LocalNav(
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
