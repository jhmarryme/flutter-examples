import 'package:flutter/material.dart';
import 'package:flutter_trip/widgets/webview/webview_page.dart';

class WebViewPageGestureWrap {
  static wrap(
      {required Widget child,
      required BuildContext context,
      required String url,
      required String title,
      bool? showAppBar = true,
      bool? backForbid = false}) {
    return GestureDetector(
      onTap: () {
        print('准备打开: $url');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewPage(
              url: url,
              title: title,
              showAppBar: showAppBar,
              backForbid: backForbid);
        }));
      },
      child: child,
    );
  }
}
