import 'dart:convert';

/// title : "门票"
/// url : "https://m.ctrip.com/webapp/ticket/ticket"
/// statusBarColor : "19A0F0"
/// hideAppBar : true
/// order : "1"

SubItem itemsFromJson(String str) => SubItem.fromJson(json.decode(str));

String itemsToJson(SubItem data) => json.encode(data.toJson());

class SubItem {
  SubItem({
    this.title,
    this.url,
    this.icon,
    this.statusBarColor,
    this.hideAppBar,
    this.order,
  });

  SubItem.fromJson(dynamic json) {
    title = json['title'];
    url = json['url'];
    icon = json['icon'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
    order = json['order'];
  }

  String? title;
  String? url;
  String? icon;
  String? statusBarColor;
  bool? hideAppBar;
  String? order;

  SubItem copyWith({
    String? title,
    String? url,
    String? icon,
    String? statusBarColor,
    bool? hideAppBar,
    String? order,
  }) =>
      SubItem(
        title: title ?? this.title,
        url: url ?? this.url,
        icon: icon ?? this.icon,
        statusBarColor: statusBarColor ?? this.statusBarColor,
        hideAppBar: hideAppBar ?? this.hideAppBar,
        order: order ?? this.order,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['url'] = url;
    map['icon'] = icon;
    map['statusBarColor'] = statusBarColor;
    map['hideAppBar'] = hideAppBar;
    map['order'] = order;
    return map;
  }
}
