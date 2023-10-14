import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/drawer_widget.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
    as responsive;

import 'views/home_view_large_raw.dart';
import 'views/home_view_small_raw.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: RouterListener(builder: (context) {
          final title = context.location;
          return Text(title);
        }),
        centerTitle: true,
      ),
      body: const responsive.WidgetBuilder(
        mobile: HomeViewSmallRaw(),
        desktop: HomeViewLargeRaw(),
      ),
    );
  }
}
