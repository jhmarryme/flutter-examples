import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:test_in_action/app/modules/examples/refresh/refresh_view_new.dart';
import 'package:test_in_action/app/modules/home/dashboard/dashboard_view.dart';
import 'package:test_in_action/app/modules/home/index/home_logic.dart';
import 'package:test_in_action/app/modules/home/quiz/quiz_view.dart';
import 'package:test_in_action/app/modules/home/settings/settings_view.dart';
import 'package:test_in_action/common/styles/sidebarx_style.dart';

/// 主页
/// 适配页面保活
class HomeViewLargeRaw extends StatefulWidget {
  const HomeViewLargeRaw({Key? key}) : super(key: key);

  @override
  _HomeViewLargeRawState createState() => _HomeViewLargeRawState();
}

class _HomeViewLargeRawState extends State<HomeViewLargeRaw> {
  late final SidebarXController _sidebarxController;
  late final PageController _pageController;

  @override
  void initState() {
    _sidebarxController = SidebarXController(selectedIndex: 0, extended: false);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _sidebarxController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    return Row(
      children: [
        SidebarX(
          controller: _sidebarxController,
          theme: SidebarxStyle.theme(),
          extendedTheme: SidebarxStyle.extendedTheme(),
          footerDivider: Column(
            children: [
              ElevatedButton(
                  onPressed: () => logic.logout(),
                  child: Icon(Icons.exit_to_app)),
              Divider(color: white.withOpacity(0.3), height: 1),
            ],
          ),
          headerBuilder: (context, extended) => SidebarxStyle.header(),
          items: [
            SidebarXItem(
                icon: Icons.home, label: 'page0', onTap: () => jumpPage(0)),
            SidebarXItem(
                icon: Icons.search, label: 'page1', onTap: () => jumpPage(1)),
            SidebarXItem(
                icon: Icons.people, label: 'page2', onTap: () => jumpPage(2)),
            SidebarXItem(
                icon: Icons.favorite, label: 'page3', onTap: () => jumpPage(3)),
          ],
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: const [
              DashboardView(),
              RefreshViewNew(),
              QuizView(),
              SettingsView(),
            ],
          ),
        ),
      ],
    );
  }

  void jumpPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}
