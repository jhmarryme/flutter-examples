import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/background.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';

import 'welcome_view_large.dart';
import 'welcome_view_small.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: ResponsiveWidgetBuilder(
          mobile: WelcomeViewSmall(),
          tablet: WelcomeViewLarge(),
          desktop: WelcomeViewLarge(),
        ),
      ),
    );
  }
}
