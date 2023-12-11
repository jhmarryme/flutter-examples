import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/business/placeholder_root_view.dart';

import 'settings/settings_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceholderRootView(
        fixedContent: SettingsView(),
        dynamicContent: child,
      ),
    );
  }
}
