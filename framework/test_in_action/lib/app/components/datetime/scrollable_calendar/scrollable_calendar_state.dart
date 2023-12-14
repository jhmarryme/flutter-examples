import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

abstract class ScrollableCalendarState {
  late final CleanCalendarController calendarController;
  final _firstDateStr = "".obs;
  final _secondDateStr = "".obs;

  String get firstDate => _firstDateStr.value;

  String get secondDate => _secondDateStr.value;

  ScrollableCalendarState() {
    calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      onRangeSelected: (minDate, maxDate) => _onRangeSelected(minDate, maxDate),
      onDayTapped: (date) {},
      // readOnly: true,
      onPreviousMinDateTapped: (date) {},
      onAfterMaxDateTapped: (date) {},
      weekdayStart: DateTime.monday,
      // initialFocusDate: DateTime(2023, 5),
      // initialDateSelected: DateTime(2022, 3, 15),
      // endDateSelected: DateTime(2022, 3, 20),
    );
  }

  void _onRangeSelected(DateTime minDate, DateTime? maxDate) {
    _firstDateStr.value = DateFormat('dd-MM-yyyy').format(minDate);
    if (maxDate != null) {
      _secondDateStr.value = DateFormat('dd-MM-yyyy').format(maxDate);
    }
  }
}
