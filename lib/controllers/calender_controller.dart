import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:machine_test/models/event.dart';
import 'package:machine_test/repositories/calendar_repo.dart';
import 'package:machine_test/services/local_preferences.dart';
import 'package:machine_test/services/route_service.dart';

class CalenderController extends GetxController {
  /// function to call controller it-self
  ///
  /// Get-x find() function to get instance of controller
  static CalenderController get calenderController => Get.find();

  RxInt currentMonth = DateTime.now().month.obs;
  RxInt currentYear = DateTime.now().year.obs;

  RxList<DateTime> monthDays = <DateTime>[].obs;

  final _localPref = GetIt.I.get<LocalPrefService>();

  final TextEditingController timeTextController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    arrangeDays();
  }

  void refreshUI() {
    update();
  }

  void changeCurrentYear(int year) {
    currentYear.value = year;
    if (currentYear.value == DateTime.now().year) {
      currentMonth.value = DateTime.now().month;
    } else {
      currentMonth.value = 1;
    }
    arrangeDays();
    refreshUI();
  }

  void changeCurrentMonth(int month) {
    if (month != 0) {
      currentMonth.value = month;
      arrangeDays();
      refreshUI();
    }
  }

  void clearEditingController() {
    titleTextController.clear();
    descriptionTextController.clear();
  }

  void autoFillUpEditingController(EventModel eventModel) {
    titleTextController.text = eventModel.title ?? '';
    descriptionTextController.text = eventModel.description ?? '';
  }

  void arrangeDays() {
    _localPref.fetchEvents();
    monthDays.value = CalenderRepo.getAllDaysFromMonthAndYear(
        month: currentMonth.value, year: currentYear.value);
  }

  Future<void> saveEventFun(int day) async {
    final newDateTime = DateTime(currentYear.value, currentMonth.value, day);
    final event = EventModel(
      title: titleTextController.text,
      description: descriptionTextController.text,
      dateTime: newDateTime,
    );
    await _localPref.saveEvent(event);
    Get.offNamed(Routes.calender);
  }

  EventModel? fetchEvent(DateTime dateTime) {
    return CalenderRepo().fetchDateEvent(dateTime);
  }
}

class CalenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalenderController>(() => CalenderController());
  }
}
