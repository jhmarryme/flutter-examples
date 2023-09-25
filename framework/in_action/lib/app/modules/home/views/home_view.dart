import 'package:flutter/material.dart';
import 'package:in_action/app/components/responsive/responsive_helper.dart'
    as responsive;
import 'package:in_action/app/modules/home/views/home_view_small.dart';

import 'home_view_large.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const responsive.WidgetBuilder(
      mobile: HomeViewSmall(),
      desktop: HomeViewLarge(),
    );
  }
}
