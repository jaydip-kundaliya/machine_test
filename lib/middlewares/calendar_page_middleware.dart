import 'package:get/get.dart';
import 'package:machine_test/controllers/calender_controller.dart';

class CalendarPageMiddle extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    final calenderCtr = CalenderController.calenderController;
    calenderCtr.refreshUI();
    return super.onPageCalled(page);
  }
}
