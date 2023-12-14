import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_in_action/common/constants/colors.dart';

class ModalBottomSheetBuilder {
  static showDefault(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: 0.5.sw,
              // Set width to half of the screen
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0)),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 1.sh * 0.06, left: 10, right: 10, bottom: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close,
                                color: ColorStyle.kGrey500)),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorStyle.kGrey100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(
                            left: 1.sw * 0.02, right: 1.sw * 0.02),
                        child: child,
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

  static showCenterSheet(BuildContext context, {required Widget child}) {
    showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Stack(
        children: [
          Positioned(
            top: 80.spMin,
            left: 0.15.sw,
            bottom: 0,
            width: 0.6.sw,
            // Set width to half of the screen
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: 1.sh * 0.06, left: 10, right: 10, bottom: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close,
                              color: ColorStyle.kGrey500)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorStyle.kGrey100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 1.sw * 0.02, right: 1.sw * 0.02),
                      child: child,
                    ),
                  ],
                ),
              ), // Replace with your actual content
            ),
          ),
        ],
      ),
    );
  }
}
