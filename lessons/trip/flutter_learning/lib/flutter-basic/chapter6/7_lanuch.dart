import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///如何打开第三方应用？
class LaunchLearning extends StatefulWidget {
  @override
  _LaunchLearningState createState() => _LaunchLearningState();
}

class _LaunchLearningState extends State<LaunchLearning> {
  var url = Uri.http('www.devio.org');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何打开第三方应用？'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchInBrowser(url),
              child: Text('打开外部浏览器'),
            ),
            ElevatedButton(
              onPressed: () => _launchInWebViewOrVC(url),
              child: Text('打开内部浏览器'),
            )
          ],
        ),
      ),
    );
  }

  // todo ios 需要做一些额外的配置
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
