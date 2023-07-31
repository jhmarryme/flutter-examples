import 'dart:convert';

import 'card_model.dart';

/// icon : "https://www.devio.org/io/flutter_app/img/sales_box_huodong.png"
/// moreUrl : "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact"
/// bigCard : [{"icon":"https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png","url":"https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg","url":"https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent","title":"活动"}]
/// smallCard : [{"icon":"https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg","url":"https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"}]

SalesBox salesBoxFromJson(String str) => SalesBox.fromJson(json.decode(str));

String salesBoxToJson(SalesBox data) => json.encode(data.toJson());

class SalesBox {
  SalesBox({
    this.icon,
    this.moreUrl,
    this.bigCard,
    this.smallCard,
  });

  SalesBox.fromJson(dynamic json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    if (json['bigCard'] != null) {
      bigCard = [];
      json['bigCard'].forEach((v) {
        bigCard?.add(CardInfo.fromJson(v));
      });
    }
    if (json['smallCard'] != null) {
      smallCard = [];
      json['smallCard'].forEach((v) {
        smallCard?.add(CardInfo.fromJson(v));
      });
    }
  }

  String? icon;
  String? moreUrl;
  List<CardInfo>? bigCard;
  List<CardInfo>? smallCard;

  SalesBox copyWith({
    String? icon,
    String? moreUrl,
    List<CardInfo>? bigCard,
    List<CardInfo>? smallCard,
  }) =>
      SalesBox(
        icon: icon ?? this.icon,
        moreUrl: moreUrl ?? this.moreUrl,
        bigCard: bigCard ?? this.bigCard,
        smallCard: smallCard ?? this.smallCard,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['moreUrl'] = moreUrl;
    if (bigCard != null) {
      map['bigCard'] = bigCard?.map((v) => v.toJson()).toList();
    }
    if (smallCard != null) {
      map['smallCard'] = smallCard?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
