import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_in_action/app/components/bottom_sheet/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/common/constants/colors.dart';

import 'choose_item_state.dart';

class ChooseItemComponent extends StatelessWidget {
  const ChooseItemComponent(
      {super.key, this.title = "Default Title", required this.state});

  final String title;
  final ChooseItemState state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: ColorStyle.kGrey200,
          elevation: 0,
        ),
        child: Row(
          children: [
            Icon(
              state.chosenItem.value.iconData,
              size: 15.spMin,
              color: ColorStyle.kGrey600,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.spMin),
              child: Text(
                state.chosenItem.value.name,
                style: TextStyle(
                  fontSize: 15.spMin,
                  color: ColorStyle.kGrey600,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          ModalBottomSheetBuilder.showDefault(
            context,
            child: Container(
              color: ColorStyle.kWhite,
              height: 0.5.sh,
              padding: EdgeInsets.all(30.spMin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.spMin),
                    child: Text(title, style: TextStyle(fontSize: 20.spMin)),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        itemCount: state.items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ElevatedButton(
                          onPressed: () {
                            state.chosenItem.value = state.items[index];
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorStyle.kWhite,
                            elevation: 0,
                            side: const BorderSide(
                              width: 0.0,
                              color: ColorStyle.kWhite,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(state.items[index].iconData, size: 15.spMin),
                              Container(
                                margin: EdgeInsets.only(left: 15.spMin),
                                child: Text(
                                  state.items[index].name,
                                  style: TextStyle(fontSize: 15.spMin),
                                ),
                              )
                            ],
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10.spMin),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
