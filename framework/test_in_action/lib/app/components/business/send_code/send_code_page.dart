import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'send_code_logic.dart';

class SendCodePage<Logic extends SendCodeLogic> extends GetView<Logic> {
  SendCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 1.sh * 0.07, left: 1.sw * 0.05, right: 1.sw * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const AutoSizeText(
                    'Pleaseenteranewemailaddress.',
                    style: TextStyle(color: ColorStyle.kGrey600),
                    presetFontSizes: [15, 12, 9, 6],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 1.sh * 0.05, bottom: 1.sh * 0.05),
                  child: FormBuilder(
                    key: controller.formKey,
                    onChanged: () {
                      controller.formKey.currentState!.save();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [...controller.children],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => controller.onSubmit(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    minimumSize: Size(500, 1.sh * 0.05),
                  ),
                  child: AutoSizeText(
                    'Next',
                    style: Get.theme.primaryTextTheme.displayMedium,
                    presetFontSizes: const [15, 12, 9, 6],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
