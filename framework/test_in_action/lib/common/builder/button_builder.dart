import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonBuilder {
  static fixedSize56Light() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Get.theme.primaryColorLight,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    );
  }

  static fixedSize56Dark() {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Get.theme.primaryColorDark,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    );
  }
}
