import 'package:flutter/material.dart';
import 'package:test_in_action/app/components/responsive/responsive_helper.dart';

class PlaceholderOrNotWidget extends StatelessWidget {
  const PlaceholderOrNotWidget({Key? key, required this.widget})
      : super(key: key);

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidgetBuilder(
      mobile: widget,
      desktop: Container(),
      tablet: Container(),
    );
  }
}
