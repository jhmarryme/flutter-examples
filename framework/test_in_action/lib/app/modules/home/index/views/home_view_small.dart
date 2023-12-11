import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/modules/home/index/home_logic.dart';
import 'package:test_in_action/app/routes/backup/app_pages.dart';

class HomeViewSmall extends GetView<HomeLogic> {
  const HomeViewSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      route: Routes.home,
      builder: (context) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.dashboard,
            anchorRoute: Routes.home,
          ),
          bottomNavigationBar: IndexedRouteBuilder(
              routes: const [
                Routes.dashboard,
                Routes.profile,
                Routes.products,
                Routes.settings,
              ],
              builder: (context, routes, index) {
                final delegate = context.delegate;
                return BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) => delegate.toNamed(routes[value]),
                  items: const [
                    // _Paths.HOME + [Empty]
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    // _Paths.HOME + Routes.PROFILE
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_rounded),
                      label: 'Profile',
                    ),
                    // _Paths.HOME + _Paths.PRODUCTS
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_rounded),
                      label: 'Products',
                    ),
                    // _Paths.HOME + _Paths.PRODUCTS
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_rounded),
                      label: 'Products',
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
