import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_action/app/modules/home/home_logic.dart';
import 'package:in_action/app/routes/app_pages.dart';

class HomeViewLarge extends GetView<HomeLogic> {
  const HomeViewLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      route: Routes.home,
      builder: (context) {
        return Scaffold(
          body: Row(
            children: [
              IndexedRouteBuilder(
                routes: const [
                  Routes.dashboard,
                  Routes.profile,
                  Routes.products,
                ],
                builder: (context, routes, index) {
                  final delegate = context.delegate;
                  return NavigationRail(
                    onDestinationSelected: (value) =>
                        delegate.toNamed(routes[value]),
                    destinations: const [
                      NavigationRailDestination(
                          icon: Icon(Icons.message_outlined),
                          label: Text("音讯")),
                      NavigationRailDestination(
                          icon: Icon(Icons.video_camera_back_outlined),
                          label: Text("视频会议")),
                      NavigationRailDestination(
                          icon: Icon(Icons.book_outlined), label: Text("通讯录")),
                    ],
                    selectedIndex: index,
                  );
                },
              ),
              Expanded(
                child: GetRouterOutlet(
                  initialRoute: Routes.dashboard,
                  anchorRoute: Routes.home,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
