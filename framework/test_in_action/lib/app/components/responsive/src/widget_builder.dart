import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart' as builder;

class WidgetBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const WidgetBuilder(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder.ScreenTypeLayout.builder(
      mobile: (p0) => mobile,
      tablet: (p0) => tablet ?? mobile,
      desktop: (p0) => desktop,
    );
  }
}
