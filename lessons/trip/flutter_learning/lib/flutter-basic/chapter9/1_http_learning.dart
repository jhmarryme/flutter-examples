import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/flutter-basic/chapter9/model/HttpModel.dart';
import 'package:http/http.dart' as http;

/// 通过插件发送http请求
/// 1. http 2. dio
class HttpLearning extends StatefulWidget {
  const HttpLearning({Key? key}) : super(key: key);

  @override
  State<HttpLearning> createState() => _HttpLearningState();
}

class _HttpLearningState extends State<HttpLearning> {
  var httpResult = '';
  var dioResult = '';
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: Column(
        children: [
          // 请求后的显示内容
          Text('sendHttpGetRequest: $httpResult'),
          Text('sendDioGetRequest: $dioResult'),
          // http request
          InkWell(
            onTap: () {
              sendHttpGetRequest().then(
                (value) {
                  setState(() {
                    print(value.toJson());
                    httpResult = value.toJson().toString();
                  });
                },
              );
            },
            child: const Text('Http: Click me'),
          ),
          // http request
          InkWell(
            onTap: () {
              sendDioGetRequest().then(
                (value) {
                  setState(() {
                    print(value.toJson());
                    dioResult = value.toJson().toString();
                  });
                },
              );
            },
            child: const Text('Dio: Click me'),
          ),
          InkWell(
            onTap: () {
              setState(() {
                dioResult = '';
                httpResult = '';
              });
            },
            child: const Text('Clean'),
          )
          // dio request
        ],
      ),
    );
  }

  /// 使用http发送请求时, 如果中文乱码, 通过utf8.decode先解码
  Future<HttpModel> sendHttpGetRequest() async {
    var url =
        Uri.http('www.devio.org', 'io/flutter_app/json/test_common_model.json');
    var response = await http.get(url);
    print('不进行utf8解码, 中文会乱码 ${convert.jsonDecode(response.body)}');
    print(
        '进行utf8解码, 中文正常显示 ${convert.jsonDecode(convert.utf8.decode(response.bodyBytes))}');
    return HttpModel.fromJson(
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes)));
  }

  /// dio发送请求响应中文不会乱码
  Future<HttpModel> sendDioGetRequest() async {
    final response = await dio
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    print(response.data);
    return HttpModel.fromJson(response.data);
  }
}
