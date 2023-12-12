import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'search_modal_bottom_sheet_logic.dart';

class SearchModalBottomSheetPage<Logic extends SearchModalBottomSheetLogic>
    extends GetView<Logic> {
  SearchModalBottomSheetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.chosen.value = false;
        searchPlace(context);
      },
      child: controller.chosen.value == false
          ? Text(
              'whereYouToGo?',
              style: TextStyle(fontSize: 15, color: ColorStyle.kGrey500),
            )
          : Text(
              controller.typeAheadController.value,
              style: TextStyle(fontSize: 15, color: ColorStyle.kGrey500),
            ),
    );
  }

  void searchPlace(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: 0.5.sw, // Set width to half of the screen
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 1.sh * 0.06, left: 10, right: 10, bottom: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child:
                                Icon(Icons.close, color: ColorStyle.kGrey500)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorStyle.kGrey100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(
                            left: 1.sw * 0.02, right: 1.sw * 0.02),
                      ),
                    ],
                  ),
                ), // Replace with your actual content
              ),
            ),
          ],
        );
      },
    );
  }
}
