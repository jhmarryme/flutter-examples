import 'package:dio/dio.dart';
import 'package:flutter_trip/dao/model/search_model.dart';

class SearchDao {
  static final Dio dio = Dio();

  static Future<SearchModel> search(String keyword) async {
    final response = await dio.get(
        'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=$keyword');
    print(response);
    return SearchModel.fromJson(response.data);
  }
}
