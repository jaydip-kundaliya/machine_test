import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:machine_test/middlewares/calendar_page_middleware.dart';

import '../ui/calendar/calendar_page.dart';
import '../ui/create_event/create_event_view.dart';

/// Route Management System
///
/// Initialize all pages routes names
@immutable
abstract class Routes {
  static const String calender = '/calender';
  static const String createEvent = '/create_event';
}

/// Register pages as par Route Management
@immutable
abstract class RoutePages {
  static String initialPage = Routes.calender;

  // Include all getPages with binding & middle-wares
  //
  // return page on user event click
  static List<GetPage<String>> routePages() {
    return <GetPage<String>>[
      GetPage<String>(
        name: Routes.calender,
        middlewares: [
          CalendarPageMiddle(),
        ],
        page: () => const CalendarPage(),
        //binding: BottomNavigatorBinding(),
      ),
      GetPage<String>(
        name: Routes.createEvent,
        page: () => const CreateEventView(),
        // binding: StoriesBinding(),
      )
    ];
  }
}
