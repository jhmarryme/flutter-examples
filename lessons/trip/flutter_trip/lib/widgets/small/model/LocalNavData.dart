import 'dart:convert';

import 'package:flutter_trip/dao/model/LocalNav.dart';

/// icon : "https://www.devio.org/io/flutter_app/img/ln_ticket.png"
/// title : "攻略·景点"
/// url : "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
/// statusBarColor : "1070b8"
/// hideAppBar : true

LocalNavData localNavListFromJson(String str) =>
    LocalNavData.fromJson(json.decode(str));

String localNavListToJson(LocalNavData data) => json.encode(data.toJson());

class LocalNavData {
  LocalNavData({
    required this.icon,
    required this.title,
    required this.url,
    this.statusBarColor,
    this.hideAppBar,
  });

  LocalNavData.fromJson(dynamic json) {
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

  LocalNavData copyWith({
    required String icon,
    required String title,
    required String url,
    String? statusBarColor,
    bool? hideAppBar,
  }) =>
      LocalNavData(
        icon: icon,
        title: title,
        url: url,
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

  LocalNavData.fromLocalNav(LocalNav localNav) {
    icon = localNav.icon;
    title = localNav.title;
    url = localNav.url;
    statusBarColor = localNav.statusBarColor;
    hideAppBar = localNav.hideAppBar;
  }
}
