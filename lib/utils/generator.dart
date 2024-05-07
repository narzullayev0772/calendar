import '../cubits/day_cubit.dart';
import '../models/day_widget_model.dart';
import '../widgets/day_widget.dart';

class Generator {
  static List<int> getDaysInMonth(DateTime date) {
    final year = date.year;
    final month = date.month;

    return List<int>.generate(
      DateTime(year, month + 1, 0).day,
      (index) => index + 1,
    );
  }

  static List<DayWidget> getDayWidgets({
    required DateTime date,
    DayLoaded? state,
  }) {
    List<DayWidget> result = [];

    DateTime firstDay = DateTime(date.year, date.month, 1);
    int daysBefore = firstDay.weekday - 1;
    // empty days before the first day of the month
    for (var i = 0; i < daysBefore; i++) {
      result.add(const DayWidget());
    }

    final daysInMonth = getDaysInMonth(date);
    List<DayWidgetModel> selectedDays = state?.selectedDays ?? [];
    for (var day in daysInMonth) {
      DayWidgetModel selectedDay = selectedDays.firstWhere(
        (element) => element.day == day,
        orElse: () => DayWidgetModel.fromDay(0),
      );
      // default day
      if (selectedDay.day == 0) {
        result.add(DayWidget(child: DayWidgetModel.fromDay(day)));
      } else {
        result.add(DayWidget(
          child: selectedDay,
          callback: () {
            // callback when a day is selected
            print({
              'day': selectedDay.day,
              'type': selectedDay.type,
            });
          },
        ));
      }
    }
    return result;
  }
}
