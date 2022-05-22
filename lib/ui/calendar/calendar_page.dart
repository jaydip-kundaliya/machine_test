import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/calender_controller.dart';
import 'package:machine_test/repositories/calendar_repo.dart';
import 'package:machine_test/ui/calendar/calender_view.dart';
import 'package:machine_test/ui/shared/app_bar.dart';
import 'package:machine_test/ui/shared/dialog_model.dart';
import 'package:machine_test/utils/extensions.dart';

import '../shared/shared_button.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calenderCtr = CalenderController.calenderController;
    return Scaffold(
      appBar: const BaseAppBar(title: 'Events'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => SharedButton.roundedCornerButton(
                      buttonText: calenderCtr.currentYear.value.toString(),
                      onPress: () {
                        _showYearSheet(context, calenderCtr);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Obx(
                    () => SharedButton.roundedCornerButton(
                      buttonText:
                          calenderCtr.currentMonth.value.fetchMonthText() ?? '',
                      onPress: () {
                        _showMonthSheet(context, calenderCtr);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Expanded(
              child: CalenderView(),
            )
          ],
        ),
      ),
    );
  }

  void _showYearSheet(
      BuildContext context, CalenderController calenderController) {
    showDialog(
      context: context,
      builder: (context) => DialogModel(
        list: CalenderRepo().availableYears,
        onItemClick: (value) {
          calenderController.changeCurrentYear(value);
        },
      ),
    );
  }

  void _showMonthSheet(
      BuildContext context, CalenderController calenderController) {
    showDialog(
      context: context,
      builder: (context) => DialogModel(
        list: CalenderRepo().months,
        onItemClick: (value) {
          calenderController
              .changeCurrentMonth(value.toString().fetchMonthNumber() ?? 0);
        },
      ),
    );
  }
}
