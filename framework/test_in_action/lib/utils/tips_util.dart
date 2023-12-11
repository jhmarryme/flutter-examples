import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TipsUtil {
  static void showLoading({String status = 'loading...'}) {
    EasyLoading.show(status: status);
  }

  static void dismiss({animation = true}) {
    EasyLoading.dismiss(animation: animation);
  }

  static void showToast(String status) {
    EasyLoading.showToast(status);
  }

  static void showDialog({
    String title = "Alert",
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleStyle,
    Widget? content,
    EdgeInsetsGeometry? contentPadding,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? onCustom,
    Color? cancelTextColor,
    Color? confirmTextColor,
    String? textConfirm,
    String? textCancel,
    String? textCustom,
    Widget? confirm,
    Widget? cancel,
    Widget? custom,
    Color? backgroundColor,
    bool barrierDismissible = true,
    Color? buttonColor,
    String middleText = "Dialog made in 3 lines of code",
    TextStyle? middleTextStyle,
    double radius = 20.0,
    List<Widget>? actions,
    WillPopCallback? onWillPop,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    Get.defaultDialog(
      title: title,
      onCancel: onCancel,
      onConfirm: onConfirm,
      textConfirm: textConfirm,
      textCancel: textCancel,
    );
  }
}
