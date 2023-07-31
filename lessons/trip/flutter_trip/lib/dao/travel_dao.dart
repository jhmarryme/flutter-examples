import 'package:dio/dio.dart';
import 'package:flutter_trip/dao/model/travel_model.dart';

const _TRAVEL_URL =
    'https://www.geekailab.com/io/flutter_app/json/travel_page.json';

class TravelDao {
  static final Dio dio = Dio();

  static Future<TravelModel> fetch() async {
    final response = await dio.get(_TRAVEL_URL);
    print(response);
    return TravelModel.fromJson(response.data);
  }
}
