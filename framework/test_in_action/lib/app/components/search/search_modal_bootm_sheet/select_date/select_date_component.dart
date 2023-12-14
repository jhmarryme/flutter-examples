import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_in_action/app/components/datetime/scrollable_calendar/scrollable_calendar_view.dart';
import 'package:test_in_action/app/components/search/search_modal_bootm_sheet/select_date/select_date_state.dart';
import 'package:test_in_action/common/builder/modal_bottom_sheet_builder.dart';
import 'package:test_in_action/common/constants/colors.dart';

class SelectDateComponent extends StatelessWidget {
  const SelectDateComponent({super.key, required this.state});

  final SelectDateState state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ModalBottomSheetBuilder.showCenterSheet(
          context,
          child: ScrollableCalendarComponent(state: state),
        );
      },
      child: Container(
        width: 1.sh * 0.6,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: ColorStyle.kGrey100,
            borderRadius: BorderRadiusDirectional.circular(10.0)),
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.center,
          child: state.firstDate.isNotEmpty
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.firstDate,
                          style: const TextStyle(
                              fontSize: 15, color: ColorStyle.kGrey500)),
                      const Text(
                        "-",
                        style:
                            TextStyle(fontSize: 15, color: ColorStyle.kGrey500),
                      ),
                      Text(
                        state.firstDate,
                        style: const TextStyle(
                            fontSize: 15, color: ColorStyle.kGrey500),
                      )
                    ],
                  ),
                )
              : const Text("Choose Date Time", style: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
