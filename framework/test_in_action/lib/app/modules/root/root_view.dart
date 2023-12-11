import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_in_action/app/components/responsive/src/widget_builder.dart';
// import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
//     as responsive;
import 'package:test_in_action/app/modules/root/views/root_view_small.dart';

import 'root_logic.dart';
import 'views/root_view_large.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key, required this.navigationShell}) : super(key: key);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    Get.put<RootLogic>(RootLogic());
    return ResponsiveWidgetBuilder(
      mobile: RootViewSmall(navigationShell: navigationShell),
      desktop: RootViewLarge(navigationShell: navigationShell),
    );
  }
}
