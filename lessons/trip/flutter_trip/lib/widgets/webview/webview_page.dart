import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigation_controls.dart';

class WebViewPage extends StatefulWidget {
  /// 打开的地址
  final String url;

  /// appbar的标题
  final String title;

  /// 是否展示appbar
  final bool? showAppBar;

  /// 是否允许回退
  final bool? backForbid;

  const WebViewPage(
      {Key? key,
      required this.url,
      required this.title,
      this.showAppBar = true,
      this.backForbid = false})
      : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 根据showAppBar变量决定是否显示appbar
        appBar: widget.showAppBar ?? false
            ? AppBar(
                // 禁用默认的返回按钮
                automaticallyImplyLeading: false,
                title: Text(widget.title),
                // 根据backForbid变量决定是否展示返回按钮
                leading: widget.backForbid ?? false
                    ? null
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                actions: [
                  // NavigationControls的实现来自与官方example
                  NavigationControls(
                    webViewController: controller,
                  ),
                ],
              )
            : null,
        body: WebViewWidget(
          controller: controller,
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () async {
            var title = await controller.getTitle();
            print(title);
          },
          child: Text('获取 title'),
        ));
  }
}
