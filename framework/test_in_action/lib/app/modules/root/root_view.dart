import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/routes/app_pages.dart';

import 'root_logic.dart';

class RootPage extends GetView<RootLogic> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const DrawerWidget(),
      // appBar: AppBar(
      //   title: RouterListener(builder: (context) {
      //     final title = context.location;
      //     return Text(title);
      //   }),
      //   centerTitle: true,
      // ),
      body: GetRouterOutlet(initialRoute: Routes.home, anchorRoute: '/'),
    );
  }
}
