import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'go_router_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: GoRouterConfiguration.router.routerDelegate,
      routeInformationParser:
          GoRouterConfiguration.router.routeInformationParser,
      routeInformationProvider:
          GoRouterConfiguration.router.routeInformationProvider,
      backButtonDispatcher: GoRouterConfiguration.router.backButtonDispatcher,
    );
  }
}
