import 'package:test_in_action/app/dao/search/city_entity.dart';
import 'package:test_in_action/common/http/dio_utils.dart';
import 'package:test_in_action/common/http/request_helper.dart';

class SearchRequestHelper {
  static Future<List<CityEntity>> pageUser(String city) async {
    final Map<String, dynamic> params = <String, dynamic>{};
    params["city"] = city;
    List<CityEntity> result =
        await RequestHelper.requestNetwork<List<CityEntity>>(
      Method.post,
      params: params,
      showLoading: false,
      url:
          "https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/v1/search/city",
    );
    return result;
  }
}
