import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/form_builder/predefined/predefined.dart';
import 'package:test_in_action/app/components/get/get_builder_view.dart';
import 'package:test_in_action/app/modules/profile/profile_setting/my_email/my_email_logic.dart';
import 'package:test_in_action/common/constants/colors.dart';
import 'package:test_in_action/utils/log_utils.dart';

class MyEmailView extends GetBuilderView<MyEmailLogic> {
  const MyEmailView({Key? key}) : super(key: key);

  @override
  void beforeBuild() {
    var logic = MyEmailLogic();
    Get.lazyPut(() => logic);
  }

  @override
  Widget doBuild(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

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
                    key: formKey,
                    onChanged: () {
                      formKey.currentState!.save();
                      LogUtil.d('${formKey.currentState?.value.toString()}');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PredefinedTextField(
                          formKey: formKey,
                          name: "Email",
                          labelText: "Email",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email()
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.saveAndValidate() ?? false) {
                      await controller.goToOtpView(
                          formKey.currentState?.fields['Email']?.value);
                    }
                  },
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
