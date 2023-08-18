import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart' as builder;

bool isMobile(BuildContext context) =>
    builder.DeviceScreenType.mobile ==
    builder.getDeviceType(MediaQuery.of(context).size);

bool isTablet(BuildContext context) =>
    builder.DeviceScreenType.tablet ==
    builder.getDeviceType(MediaQuery.of(context).size);

bool isDesktop(BuildContext context) =>
    builder.DeviceScreenType.desktop ==
    builder.getDeviceType(MediaQuery.of(context).size);

T getValueForScreenType<T>({
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
  T? watch,
}) {
  return builder.getValueForScreenType(
    context: context,
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
    watch: watch,
  );
}
