import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:machine_test/models/event.dart';
import 'package:machine_test/services/local_preferences.dart';

class CalenderRepo {
  final _localRepo = GetIt.I.get<LocalPrefService>();

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final List<int> availableYears = [
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025
  ];

  static List<DateTime> getAllDaysFromMonthAndYear({
    required int month,
    required int year,
  }) {
    // Take the input year, month number, and pass it inside DateTime()
    final now = DateTime(year, month);

    // Getting the total number of days of the month
    final totalDays = daysInMonth(now);

    // Stroing all the dates till the last date
    // since we have found the last date using generate
    final listOfDates =
        List<DateTime>.generate(totalDays, (i) => DateTime(year, month, i + 1));
    return listOfDates;
  }

  // this returns the last date of the month using DateTime
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  EventModel? fetchDateEvent(DateTime dateTime) {
    EventModel? resultEvent;
    List<EventModel> events = _localRepo.fetchEvents();
    final selectedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
    for (final event in events) {
      final eventDate = DateFormat('dd-MMM-yyyy').format(event.dateTime!);
      if (eventDate == selectedDate) {
        resultEvent = event;
        break;
      }
    }
    return resultEvent;
  }
}
