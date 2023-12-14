import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:test_in_action/app/components/datetime/scrollable_calendar/scrollable_calendar_state.dart';
import 'package:test_in_action/common/constants/colors.dart';

class ScrollableCalendarComponent extends StatelessWidget {
  const ScrollableCalendarComponent({super.key, required this.state});

  final ScrollableCalendarState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 1.sh * 0.8,
          child: ScrollableCleanCalendar(
            calendarController: state.calendarController,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorStyle.kBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(width: 0.0, color: ColorStyle.kBlue)),
            elevation: 0,
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 15, color: ColorStyle.kWhite),
          ),
        ),
      ],
    );
  }
}
