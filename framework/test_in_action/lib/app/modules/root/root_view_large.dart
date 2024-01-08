import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/src/route.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_in_action/common/builder/sidebarx_style_builder.dart';

import 'root_logic.dart';

/// 主页
/// 适配页面保活
class RootViewLarge extends GetView<RootLogic> {
  const RootViewLarge({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    SidebarXController sidebarxController =
        SidebarXController(selectedIndex: navigationShell.currentIndex);
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: sidebarxController,
            theme: SidebarxStyleBuilder.theme(),
            extendedTheme: SidebarxStyleBuilder.extendedTheme(),
            footerDivider: Column(
              children: [
                ElevatedButton(
                    onPressed: () => controller.doLogout(context),
                    child: Icon(Icons.exit_to_app)),
                Divider(color: white.withOpacity(0.3), height: 1),
              ],
            ),
            headerBuilder: (context, extended) => SidebarxStyleBuilder.header(),
            items: [
              SidebarXItem(
                  icon: Icons.home,
                  label: 'page0',
                  onTap: () => _onTap(context, 0)),
              SidebarXItem(
                  icon: Icons.search,
                  label: 'page1',
                  onTap: () => _onTap(context, 1)),
              SidebarXItem(
                  icon: Icons.people,
                  label: 'page2',
                  onTap: () => _onTap(context, 2)),
              // SidebarXItem(
              //     icon: Icons.favorite,
              //     label: 'page3',
              //     onTap: () => _onTap(context, 3)),
            ],
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
