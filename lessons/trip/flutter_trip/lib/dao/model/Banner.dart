import 'dart:convert';

/// icon : "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg"
/// url : "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"

SubBanner bannerListFromJson(String str) =>
    SubBanner.fromJson(json.decode(str));
String bannerListToJson(SubBanner data) => json.encode(data.toJson());

class SubBanner {
  SubBanner({
    this.icon,
    this.url,
  });

  SubBanner.fromJson(dynamic json) {
    icon = json['icon'];
    url = json['url'];
  }
  String? icon;
  String? url;
  SubBanner copyWith({
    String? icon,
    String? url,
  }) =>
      SubBanner(
        icon: icon ?? this.icon,
        url: url ?? this.url,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['url'] = url;
    return map;
  }
}
