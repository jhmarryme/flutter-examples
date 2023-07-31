import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/flutter-basic/chapter9/model/HttpModel.dart';

/// 通过FutureBuilder初始化页面
class FutureLearning extends StatefulWidget {
  const FutureLearning({Key? key}) : super(key: key);

  @override
  State<FutureLearning> createState() => _FutureLearningState();
}

class _FutureLearningState extends State<FutureLearning> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: FutureBuilder<HttpModel>(
        future: sendDioGetRequest(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('ConnectionState.none');
              return const Text('Input a URL to start');
            case ConnectionState.waiting:
              print('ConnectionState.waiting');
              return const Center(
                // 进度指示器
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              print('ConnectionState.active');
              return const Text('');
            case ConnectionState.done:
              print('ConnectionState.done');
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Column(
                  children: [
                    Text('icon:${snapshot.data?.icon}'),
                    Text('statusBarColor:${snapshot.data?.statusBarColor}'),
                    Text('title:${snapshot.data?.title}'),
                    Text('url:${snapshot.data?.url}')
                  ],
                );
              }
          }
        },
      ),
    );
  }

  /// dio发送请求响应中文不会乱码
  Future<HttpModel> sendDioGetRequest() async {
    final response = await dio
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    print(response.data);
    return HttpModel.fromJson(response.data);
  }
}
