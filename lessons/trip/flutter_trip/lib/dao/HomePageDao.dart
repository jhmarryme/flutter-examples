import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'model/HomePageModel.dart';

class HomePageDao {
  static final dio = Dio();

  /// dio发送请求响应中文不会乱码
  static Future<HomePageModel> sendDioGetRequest() async {
    // final response = await dio
    //     .get('https://www.geekailab.com/io/flutter_app/json/home_page.json');

    String jsonStr =
        await rootBundle.loadString('assets/json/homePageModel.json');
    final jsonRes = json.decode(jsonStr);
    return HomePageModel.fromJson(jsonRes);
  }
}
