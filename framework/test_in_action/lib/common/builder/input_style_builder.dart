import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/constants/style_constants.dart';

class InputStyleBuilder {
  static inputDecorationDefault() {
    return InputDecorationTheme(
      filled: true,
      fillColor: Get.theme.primaryColorLight,
      iconColor: Get.theme.primaryColor,
      prefixIconColor: Get.theme.primaryColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: StyleConstants.defaultPadding,
        vertical: StyleConstants.defaultPadding,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    );
  }
}
