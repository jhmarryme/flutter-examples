import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/main_menu.dart';
import 'presentation/route.dart' as route;

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainMenu(),
      routes: buildRoute(),
    );
  }

  buildRoute() {
    Map<String, WidgetBuilder> map = {};
    for (var page in route.pages) {
      for (var item in page.items!) {
        map[item.title] = (context) => item.page;
      }
    }
    return map;
  }
}
