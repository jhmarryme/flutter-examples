import 'package:dio/dio.dart';

import 'model/travel_tab_model.dart';

const _TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';
var params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

class TravelTabDao {
  static final Dio dio = Dio();

  static Future<TravelTabModel> fetch(String travelUrl, Map params,
      String groupChannelCode, int pageIndex) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    params['groupChannelCode'] = groupChannelCode;
    final response = await dio.post(_TRAVEL_URL, data: params);
    print(response);
    return TravelTabModel.fromJson(response.data);
  }
}
