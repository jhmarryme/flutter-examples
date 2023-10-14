import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart'
    as responsive;

import 'views/settings_view_large.dart';
import 'views/settings_view_small.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return responsive.WidgetBuilder(
      mobile: SettingsViewSmall(),
      tablet: SettingsViewLarge(),
      desktop: SettingsViewLarge(),
    );
  }
}
