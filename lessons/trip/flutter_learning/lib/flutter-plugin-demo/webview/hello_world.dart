import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1
  late WebViewController controller;

  @override
  void initState() {
    // 2
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://juejin.cn'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
              children: [
                // 3
                Expanded(child: WebViewWidget(controller: controller))
              ],
            ),
            floatingActionButton: ElevatedButton(
              onPressed: () async {
                var title = await controller.getTitle();
                print(title);
              },
              child: Text('获取 title'),
            )));
  }
}
