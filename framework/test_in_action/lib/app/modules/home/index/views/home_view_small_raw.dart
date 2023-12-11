import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/modules/examples/refresh/refresh_view_new.dart';
import 'package:test_in_action/app/modules/home/dashboard/dashboard_view.dart';
import 'package:test_in_action/app/modules/home/quiz/quiz_view.dart';
import 'package:test_in_action/app/modules/home/settings/settings_view.dart';
import 'package:test_in_action/common/builder/shadow_style_builder.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/config/translations/strings_enum.dart';

import 'widgets/home_tab_title.dart';

class HomeViewSmallRaw extends StatefulWidget {
  const HomeViewSmallRaw({Key? key}) : super(key: key);

  @override
  _HomeViewSmallRawState createState() => _HomeViewSmallRawState();
}

class _HomeViewSmallRawState extends State<HomeViewSmallRaw>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  ///控制器
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          DashboardView(),
          RefreshViewNew(),
          QuizView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: ShadowStyleBuilder.white12TopSpread4Blur10(radius: 0),
        child: TabBar(
          indicator: const BoxDecoration(),
          labelColor: ColorStyle.color_24CF5F,
          unselectedLabelColor: ColorStyle.color_B8C0D4,
          controller: tabController,
          tabs: [
            TabTitleIcon(title: StringStyles.homeComplex.tr, icon: Icons.home),
            TabTitleIcon(
                title: StringStyles.homeProject.tr, icon: Icons.search),
            TabTitleIcon(title: StringStyles.homeMy.tr, icon: Icons.people),
            TabTitleIcon(title: StringStyles.homeMy.tr, icon: Icons.favorite),
          ],
        ),
      ),
    );
  }
}
