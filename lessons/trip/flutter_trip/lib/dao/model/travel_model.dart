import 'dart:convert';

/// url : "https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5"
/// params : {"districtId":-1,"groupChannelCode":"tourphoto_global1","type":null,"lat":-180,"lon":-180,"locatedDistrictId":2,"pagePara":{"pageIndex":1,"pageSize":10,"sortType":9,"sortDirection":0},"imageCutType":1,"head":{"cid":"09031014111431397988","ctok":"","cver":"1.0","lang":"01","sid":"8888","syscode":"09","auth":null,"extension":[{"name":"protocal","value":"https"}]},"contentType":"json"}
/// tabs : [{"labelName":"发现","groupChannelCode":"tourphoto_global1"},{"labelName":"玩乐","groupChannelCode":"xinqitiyan"},{"labelName":"酒店","groupChannelCode":"hotel"},{"labelName":"美食","groupChannelCode":"msxwzl"},{"labelName":"亲子","groupChannelCode":"children"},{"labelName":"网红","groupChannelCode":"wanghongdakadi"},{"labelName":"拍照技巧","groupChannelCode":"tab-photo"}]

TravelModel travelModelFromJson(String str) =>
    TravelModel.fromJson(json.decode(str));
String travelModelToJson(TravelModel data) => json.encode(data.toJson());

class TravelModel {
  TravelModel({
    this.url,
    this.params,
    this.tabs,
  });

  TravelModel.fromJson(dynamic json) {
    url = json['url'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    if (json['tabs'] != null) {
      tabs = [];
      json['tabs'].forEach((v) {
        tabs?.add(Tabs.fromJson(v));
      });
    }
  }
  String? url;
  Params? params;
  List<Tabs>? tabs;
  TravelModel copyWith({
    String? url,
    Params? params,
    List<Tabs>? tabs,
  }) =>
      TravelModel(
        url: url ?? this.url,
        params: params ?? this.params,
        tabs: tabs ?? this.tabs,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (tabs != null) {
      map['tabs'] = tabs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// labelName : "发现"
/// groupChannelCode : "tourphoto_global1"

Tabs tabsFromJson(String str) => Tabs.fromJson(json.decode(str));
String tabsToJson(Tabs data) => json.encode(data.toJson());

class Tabs {
  Tabs({
    this.labelName,
    this.groupChannelCode,
  });

  Tabs.fromJson(dynamic json) {
    labelName = json['labelName'];
    groupChannelCode = json['groupChannelCode'];
  }
  String? labelName;
  String? groupChannelCode;
  Tabs copyWith({
    String? labelName,
    String? groupChannelCode,
  }) =>
      Tabs(
        labelName: labelName ?? this.labelName,
        groupChannelCode: groupChannelCode ?? this.groupChannelCode,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['labelName'] = labelName;
    map['groupChannelCode'] = groupChannelCode;
    return map;
  }
}

/// districtId : -1
/// groupChannelCode : "tourphoto_global1"
/// type : null
/// lat : -180
/// lon : -180
/// locatedDistrictId : 2
/// pagePara : {"pageIndex":1,"pageSize":10,"sortType":9,"sortDirection":0}
/// imageCutType : 1
/// head : {"cid":"09031014111431397988","ctok":"","cver":"1.0","lang":"01","sid":"8888","syscode":"09","auth":null,"extension":[{"name":"protocal","value":"https"}]}
/// contentType : "json"

Params paramsFromJson(String str) => Params.fromJson(json.decode(str));
String paramsToJson(Params data) => json.encode(data.toJson());

class Params {
  Params({
    this.districtId,
    this.groupChannelCode,
    this.type,
    this.lat,
    this.lon,
    this.locatedDistrictId,
    this.pagePara,
    this.imageCutType,
    this.head,
    this.contentType,
  });

  Params.fromJson(dynamic json) {
    districtId = json['districtId'];
    groupChannelCode = json['groupChannelCode'];
    type = json['type'];
    lat = json['lat'];
    lon = json['lon'];
    locatedDistrictId = json['locatedDistrictId'];
    pagePara =
        json['pagePara'] != null ? PagePara.fromJson(json['pagePara']) : null;
    imageCutType = json['imageCutType'];
    head = json['head'] != null ? Head.fromJson(json['head']) : null;
    contentType = json['contentType'];
  }
  num? districtId;
  String? groupChannelCode;
  dynamic type;
  num? lat;
  num? lon;
  num? locatedDistrictId;
  PagePara? pagePara;
  num? imageCutType;
  Head? head;
  String? contentType;
  Params copyWith({
    num? districtId,
    String? groupChannelCode,
    dynamic type,
    num? lat,
    num? lon,
    num? locatedDistrictId,
    PagePara? pagePara,
    num? imageCutType,
    Head? head,
    String? contentType,
  }) =>
      Params(
        districtId: districtId ?? this.districtId,
        groupChannelCode: groupChannelCode ?? this.groupChannelCode,
        type: type ?? this.type,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        locatedDistrictId: locatedDistrictId ?? this.locatedDistrictId,
        pagePara: pagePara ?? this.pagePara,
        imageCutType: imageCutType ?? this.imageCutType,
        head: head ?? this.head,
        contentType: contentType ?? this.contentType,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['districtId'] = districtId;
    map['groupChannelCode'] = groupChannelCode;
    map['type'] = type;
    map['lat'] = lat;
    map['lon'] = lon;
    map['locatedDistrictId'] = locatedDistrictId;
    if (pagePara != null) {
      map['pagePara'] = pagePara?.toJson();
    }
    map['imageCutType'] = imageCutType;
    if (head != null) {
      map['head'] = head?.toJson();
    }
    map['contentType'] = contentType;
    return map;
  }
}

/// cid : "09031014111431397988"
/// ctok : ""
/// cver : "1.0"
/// lang : "01"
/// sid : "8888"
/// syscode : "09"
/// auth : null
/// extension : [{"name":"protocal","value":"https"}]

Head headFromJson(String str) => Head.fromJson(json.decode(str));
String headToJson(Head data) => json.encode(data.toJson());

class Head {
  Head({
    this.cid,
    this.ctok,
    this.cver,
    this.lang,
    this.sid,
    this.syscode,
    this.auth,
    this.extension,
  });

  Head.fromJson(dynamic json) {
    cid = json['cid'];
    ctok = json['ctok'];
    cver = json['cver'];
    lang = json['lang'];
    sid = json['sid'];
    syscode = json['syscode'];
    auth = json['auth'];
    if (json['extension'] != null) {
      extension = [];
      json['extension'].forEach((v) {
        extension?.add(Extension.fromJson(v));
      });
    }
  }
  String? cid;
  String? ctok;
  String? cver;
  String? lang;
  String? sid;
  String? syscode;
  dynamic auth;
  List<Extension>? extension;
  Head copyWith({
    String? cid,
    String? ctok,
    String? cver,
    String? lang,
    String? sid,
    String? syscode,
    dynamic auth,
    List<Extension>? extension,
  }) =>
      Head(
        cid: cid ?? this.cid,
        ctok: ctok ?? this.ctok,
        cver: cver ?? this.cver,
        lang: lang ?? this.lang,
        sid: sid ?? this.sid,
        syscode: syscode ?? this.syscode,
        auth: auth ?? this.auth,
        extension: extension ?? this.extension,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cid'] = cid;
    map['ctok'] = ctok;
    map['cver'] = cver;
    map['lang'] = lang;
    map['sid'] = sid;
    map['syscode'] = syscode;
    map['auth'] = auth;
    if (extension != null) {
      map['extension'] = extension?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "protocal"
/// value : "https"

Extension extensionFromJson(String str) => Extension.fromJson(json.decode(str));
String extensionToJson(Extension data) => json.encode(data.toJson());

class Extension {
  Extension({
    this.name,
    this.value,
  });

  Extension.fromJson(dynamic json) {
    name = json['name'];
    value = json['value'];
  }
  String? name;
  String? value;
  Extension copyWith({
    String? name,
    String? value,
  }) =>
      Extension(
        name: name ?? this.name,
        value: value ?? this.value,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    return map;
  }
}

/// pageIndex : 1
/// pageSize : 10
/// sortType : 9
/// sortDirection : 0

PagePara pageParaFromJson(String str) => PagePara.fromJson(json.decode(str));
String pageParaToJson(PagePara data) => json.encode(data.toJson());

class PagePara {
  PagePara({
    this.pageIndex,
    this.pageSize,
    this.sortType,
    this.sortDirection,
  });

  PagePara.fromJson(dynamic json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    sortType = json['sortType'];
    sortDirection = json['sortDirection'];
  }
  num? pageIndex;
  num? pageSize;
  num? sortType;
  num? sortDirection;
  PagePara copyWith({
    num? pageIndex,
    num? pageSize,
    num? sortType,
    num? sortDirection,
  }) =>
      PagePara(
        pageIndex: pageIndex ?? this.pageIndex,
        pageSize: pageSize ?? this.pageSize,
        sortType: sortType ?? this.sortType,
        sortDirection: sortDirection ?? this.sortDirection,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageIndex'] = pageIndex;
    map['pageSize'] = pageSize;
    map['sortType'] = sortType;
    map['sortDirection'] = sortDirection;
    return map;
  }
}
