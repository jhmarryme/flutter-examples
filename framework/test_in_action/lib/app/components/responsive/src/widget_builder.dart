import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveWidgetBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidgetBuilder(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => mobile,
      tablet: (p0) => tablet ?? mobile,
      desktop: (p0) => desktop,
    );
  }
}
