import 'dart:convert';

/// data : [{"code":"district_158","word":"重庆","type":"district","districtname":"中国","url":"http://m.ctrip.com/webapp/you/place/158.html","isBigIcon":false},{"code":"districtsight_158","word":"重庆·热门景点","type":"sight","districtname":"","url":"https://m.ctrip.com/webapp/you/sight/158.html","isBigIcon":false},{"code":"sight_43811","word":"磁器口古镇","type":"sight","districtname":"重庆","url":"http://m.ctrip.com/webapp/you/sight/158/43811.html","isBigIcon":false},{"code":"sight_109940","word":"长江索道","type":"sight","districtname":"重庆","url":"http://m.ctrip.com/webapp/you/sight/158/109940.html","isBigIcon":false},{"code":"sight_50223","word":"洪崖洞民俗风貌区","type":"sight","districtname":"重庆","url":"http://m.ctrip.com/webapp/you/sight/158/50223.html","isBigIcon":false},{"code":"channeltravelsearch_0","word":"重庆的全部旅游产品","type":"channeltravelsearch","url":"http://m.ctrip.com/webapp/tour/tours?saleCityId=4&kwd=重庆","isBigIcon":false},{"code":"hotellist_158","word":"重庆的酒店","type":"hotellist","districtname":"中国","url":"http://m.ctrip.com/webapp/hotel/chongqing4","isBigIcon":false},{"code":"cityinn_4","word":"重庆·民宿客栈","type":"inn","districtname":"家庭出游新选择","url":"https://m.tujia.com/hotel_city22/?ssr=off&code=search_63","isBigIcon":false},{"code":"channelticketsearch_158","word":"重庆·景点门票","type":"channelticketsearch","url":"http://m.ctrip.com/webapp/ticket/dest/k-keyword-0/s-tickets?keyword=%E9%87%8D%E5%BA%86&scname=%E9%87%8D%E5%BA%86","isBigIcon":false},{"code":"channelgroupsearch_158","word":"重庆·定制包团","type":"channelgroupsearch","url":"https://m.ctrip.com/webapp/dingzhi/directDemand","isBigIcon":false},{"code":"districtfood_158","word":"重庆·必吃美食","type":"districtfood","districtname":"","url":"http://m.ctrip.com/webapp/you/foods/158.html","isBigIcon":false}]
/// resultPageUrl : "http://m.ctrip.com/webapp/you/place/158.html"

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.data,
    this.resultPageUrl,
  });

  SearchModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    resultPageUrl = json['resultPageUrl'];
  }

  List<Data>? data;
  String? resultPageUrl;

  SearchModel copyWith({
    List<Data>? data,
    String? resultPageUrl,
  }) =>
      SearchModel(
        data: data ?? this.data,
        resultPageUrl: resultPageUrl ?? this.resultPageUrl,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['resultPageUrl'] = resultPageUrl;
    return map;
  }
}

/// code : "district_158"
/// word : "重庆"
/// type : "district"
/// districtname : "中国"
/// url : "http://m.ctrip.com/webapp/you/place/158.html"
/// isBigIcon : false

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.code,
    this.word,
    this.type,
    this.districtname,
    this.url,
    this.isBigIcon,
  });

  Data.fromJson(dynamic json) {
    code = json['code'];
    word = json['word'];
    type = json['type'];
    districtname = json['districtname'];
    url = json['url'];
    isBigIcon = json['isBigIcon'];
  }

  String? code;
  String? word;
  String? type;
  String? districtname;
  String? url;
  bool? isBigIcon;

  Data copyWith({
    String? code,
    String? word,
    String? type,
    String? districtname,
    String? url,
    bool? isBigIcon,
  }) =>
      Data(
        code: code ?? this.code,
        word: word ?? this.word,
        type: type ?? this.type,
        districtname: districtname ?? this.districtname,
        url: url ?? this.url,
        isBigIcon: isBigIcon ?? this.isBigIcon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['word'] = word;
    map['type'] = type;
    map['districtname'] = districtname;
    map['url'] = url;
    map['isBigIcon'] = isBigIcon;
    return map;
  }
}
