import 'dart:convert';

import 'Banner.dart';
import 'Config.dart';
import 'GridNav.dart';
import 'LocalNav.dart';
import 'SubNav.dart';
import 'sales_box_model.dart';

/// config : {"searchUrl":"https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword="}
/// bannerList : [{"icon":"https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg","url":"https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"},{"icon":"https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg","url":"https://m.ctrip.com/webapp/vacations/tour/detail?productid=3168213&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"},{"icon":"http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg","url":"https://m.ctrip.com/events/jiudianshangchenghuodong.html?disable_webview_cache_key=1"},{"icon":"https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg","url":"https://m.ctrip.com/webapp/vacations/tour/detail?productid=53720&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"}]
/// localNavList : [{"icon":"https://www.devio.org/io/flutter_app/img/ln_ticket.png","title":"攻略·景点","url":"https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F","statusBarColor":"1070b8","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/ln_weekend.png","title":"周边游","url":"https://m.ctrip.com/webapp/vacations/tour/around?&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F","statusBarColor":"52149f","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/ln_food.png","title":"美食林","url":"https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true","statusBarColor":"19A0F0","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/ln_oneday.png","title":"一日游","url":"https://dp.ctrip.com/webapp/activity/daytour","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/ln_guide.png","title":"当地攻略","url":"https://m.ctrip.com/webapp/you/","statusBarColor":"19A0F0","hideAppBar":true}]
/// gridNav : [{"label":"hotel","startColor":"fa5956","endColor":"fa9b4d","mainItem":{"title":"酒店","icon":"https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png","url":"https://m.ctrip.com/webapp/hotel/","statusBarColor":"4289ff"},"items":[{"title":"海外酒店","url":"https://m.ctrip.com/webapp/hotel/oversea/?otype=1","statusBarColor":"4289ff","order":"1"},{"title":"特价酒店","url":"https://m.ctrip.com/webapp/hotel/hotsale","order":"2"},{"title":"团购","url":"https://m.ctrip.com/webapp/tuan/?secondwakeup=true&dpclickjump=true","hideAppBar":true,"order":"3"},{"title":"民宿 客栈","url":"https://m.ctrip.com/webapp/inn/index","hideAppBar":true,"order":"4"}]},{"label":"flight","startColor":"4b8fed","endColor":"53bced","mainItem":{"title":"机票","icon":"https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png","url":"https://m.ctrip.com/html5/flight/swift/index"},"items":[{"title":"火车票","url":"https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539","hideAppBar":true,"order":"1"},{"title":"特价机票","url":"https://m.ctrip.com/html5/flight/swift/index","order":"2"},{"title":"汽车票·船票","url":"https://m.ctrip.com/html5/Trains/bus/","hideAppBar":true,"order":"3"},{"title":"专车·租车","url":"https://m.ctrip.com/webapp/car/index?s=ctrip&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F","hideAppBar":true,"order":"4"}]},{"label":"travel","startColor":"34c2aa","endColor":"6cd557","mainItem":{"title":"旅游","icon":"https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png","url":"https://m.ctrip.com/webapp/vacations/tour/vacations","hideAppBar":true,"statusBarColor":"19A0F0"},"items":[{"title":"旅游","icon":"https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png","url":"https://m.ctrip.com/webapp/vacations/tour/vacations","hideAppBar":true,"statusBarColor":"19A0F0"},{"title":"门票","url":"https://m.ctrip.com/webapp/ticket/ticket","statusBarColor":"19A0F0","hideAppBar":true},{"title":"目的地攻略","url":"https://m.ctrip.com/html5/you/","statusBarColor":"19A0F0","hideAppBar":true},{"title":"邮轮旅行","url":"https://m.ctrip.com/webapp/cruise/index","hideAppBar":true},{"title":"定制旅行","url":"https://m.ctrip.com/webapp/dingzhi","hideAppBar":true}]}]
/// subNavList : [{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_wifi.png","title":"WiFi电话卡","url":"https://m.ctrip.com/webapp/activity/wifi","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_visa.png","title":"保险·签证","url":"https://m.ctrip.com/webapp/tourvisa/entry","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_exchange.png","title":"外币兑换","url":"https://dp.ctrip.com/webapp/forex/index?bid=2&1=1","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_shopping.png","title":"购物","url":"https://m.ctrip.com/webapp/gshop/?ctm_ref=M_ps_2home_sl&bid=2&cid=3&pid=1","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_guide.png","title":"当地向导","url":"https://m.ctrip.com/webapp/vacations/pguider/homepage?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_freetravel.png","title":"自由行","url":"https://dp.ctrip.com/webapp/vacations/idiytour/diyindex?navBarStyle=white","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_play.png","title":"境外玩乐","url":"https://dp.ctrip.com/webapp/activity/overseasindex","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_lipin.png","title":"礼品卡","url":"https://dp.ctrip.com/webapp/lipin/money","hideAppBar":true},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_credit.png","title":"信用卡","url":"https://dp.ctrip.com/webapp/cc/index?bid=8&cid=1&pid=4"},{"icon":"https://www.devio.org/io/flutter_app/img/sub_nav_more.png","title":"更多","url":"https://dp.ctrip.com/webapp/more/","hideAppBar":true}]
/// salesBox : {"icon":"https://www.devio.org/io/flutter_app/img/sales_box_huodong.png","moreUrl":"https://contents.ctrip.com/activitysetupapp/mkt/index/moreact","bigCard":[{"icon":"https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png","url":"https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg","url":"https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent","title":"活动"}],"smallCard":[{"icon":"https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg","url":"https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"},{"icon":"https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg","url":"https://smarket.ctrip.com/webapp/promocode/add?source=5","title":"活动"}]}

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.config,
    this.bannerList,
    required this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBox,
  });

  HomePageModel.fromJson(dynamic json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
    if (json['bannerList'] != null) {
      bannerList = [];
      json['bannerList'].forEach((v) {
        bannerList?.add(SubBanner.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = [];
      json['localNavList'].forEach((v) {
        localNavList.add(LocalNav.fromJson(v));
      });
    }
    if (json['gridNav'] != null) {
      gridNav = [];
      json['gridNav'].forEach((v) {
        gridNav?.add(GridNav.fromJson(v));
      });
    }
    if (json['subNavList'] != null) {
      subNavList = [];
      json['subNavList'].forEach((v) {
        subNavList?.add(SubNav.fromJson(v));
      });
    }
    salesBox =
        json['salesBox'] != null ? SalesBox.fromJson(json['salesBox']) : null;
  }

  Config? config;
  List<SubBanner>? bannerList;
  late List<LocalNav> localNavList;
  List<GridNav>? gridNav;
  List<SubNav>? subNavList;
  SalesBox? salesBox;

  HomePageModel copyWith({
    Config? config,
    List<SubBanner>? bannerList,
    List<LocalNav>? localNavList,
    List<GridNav>? gridNav,
    List<SubNav>? subNavList,
    SalesBox? salesBox,
  }) =>
      HomePageModel(
        config: config ?? this.config,
        bannerList: bannerList ?? this.bannerList,
        localNavList: localNavList ?? this.localNavList,
        gridNav: gridNav ?? this.gridNav,
        subNavList: subNavList ?? this.subNavList,
        salesBox: salesBox ?? this.salesBox,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (config != null) {
      map['config'] = config?.toJson();
    }
    if (bannerList != null) {
      map['bannerList'] = bannerList?.map((v) => v.toJson()).toList();
    }
    map['localNavList'] = localNavList.map((v) => v.toJson()).toList();
    if (gridNav != null) {
      map['gridNav'] = gridNav?.map((v) => v.toJson()).toList();
    }
    if (subNavList != null) {
      map['subNavList'] = subNavList?.map((v) => v.toJson()).toList();
    }
    if (salesBox != null) {
      map['salesBox'] = salesBox?.toJson();
    }
    return map;
  }
}
