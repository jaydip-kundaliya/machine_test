import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/calender_controller.dart';
import 'package:machine_test/services/route_service.dart';
import 'package:machine_test/ui/calendar/day_tile.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calenderCtr = CalenderController.calenderController;
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => ListView.separated(
              itemCount: calenderCtr.monthDays.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => DayTile(
                day: calenderCtr.monthDays[index],
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}
