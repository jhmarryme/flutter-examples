import 'dart:convert';

import 'SubItem.dart';

/// label : "hotel"
/// startColor : "fa5956"
/// endColor : "fa9b4d"
/// mainItem : {"title":"酒店","icon":"https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png","url":"https://m.ctrip.com/webapp/hotel/","statusBarColor":"4289ff"}
/// items : [{"title":"海外酒店","url":"https://m.ctrip.com/webapp/hotel/oversea/?otype=1","statusBarColor":"4289ff","order":"1"},{"title":"特价酒店","url":"https://m.ctrip.com/webapp/hotel/hotsale","order":"2"},{"title":"团购","url":"https://m.ctrip.com/webapp/tuan/?secondwakeup=true&dpclickjump=true","hideAppBar":true,"order":"3"},{"title":"民宿 客栈","url":"https://m.ctrip.com/webapp/inn/index","hideAppBar":true,"order":"4"}]

GridNav gridNavFromJson(String str) => GridNav.fromJson(json.decode(str));

String gridNavToJson(GridNav data) => json.encode(data.toJson());

class GridNav {
  GridNav({
    this.label,
    this.startColor,
    this.endColor,
    this.mainItem,
    this.items,
  });

  GridNav.fromJson(dynamic json) {
    label = json['label'];
    startColor = json['startColor'];
    endColor = json['endColor'];
    mainItem =
        json['mainItem'] != null ? SubItem.fromJson(json['mainItem']) : null;
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(SubItem.fromJson(v));
      });
    }
  }

  String? label;
  String? startColor;
  String? endColor;
  SubItem? mainItem;
  List<SubItem>? items;

  GridNav copyWith({
    String? label,
    String? startColor,
    String? endColor,
    SubItem? mainItem,
    List<SubItem>? items,
  }) =>
      GridNav(
        label: label ?? this.label,
        startColor: startColor ?? this.startColor,
        endColor: endColor ?? this.endColor,
        mainItem: mainItem ?? this.mainItem,
        items: items ?? this.items,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['startColor'] = startColor;
    map['endColor'] = endColor;
    if (mainItem != null) {
      map['mainItem'] = mainItem?.toJson();
    }
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
