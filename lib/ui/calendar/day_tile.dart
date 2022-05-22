import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machine_test/utils/app_text_style.dart';
import 'package:machine_test/utils/extensions.dart';

import '../../controllers/calender_controller.dart';
import '../../services/route_service.dart';

class DayTile extends StatelessWidget {
  final DateTime day;
  const DayTile({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalenderController>(builder: (controller) {
      final event = controller.fetchEvent(day);
      return InkWell(
        onTap: () {
          Get.toNamed(
            Routes.createEvent,
            arguments: event ?? day,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  Text(
                    day.day.toString(),
                    style: AppTextStyle.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    day.month.fetchMonthText() ?? '',
                    style: AppTextStyle.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                thickness: 2,
              ),
            ),
            event != null
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('HH:MM dd-MMM-yyyy')
                                .format(event.dateTime!),
                            style: AppTextStyle.poppins(),
                          ),
                          Text(
                            event.title ?? '',
                            style: AppTextStyle.poppins(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
