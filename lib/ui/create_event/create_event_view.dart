import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machine_test/controllers/calender_controller.dart';
import 'package:machine_test/models/event.dart';
import 'package:machine_test/ui/shared/shared_button.dart';
import 'package:machine_test/utils/app_text_style.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../shared/app_bar.dart';
import '../shared/input_field.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final calenderCtr = CalenderController.calenderController;
    DateTime selectedDate = _initializeArguments(calenderCtr);
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Event Details',
        leading: Center(
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Back',
              style: AppTextStyle.poppins(fontSize: 18),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Date & Time',
                        style: AppTextStyle.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: InputField(
                            textEditingController:
                                calenderCtr.timeTextController,
                            placeholder: 'HH:MM',
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return 'Unvalid';
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                              MaskTextInputFormatter(
                                mask: '##:##',
                                filter: {"#": RegExp(r'[0-9]')},
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('dd-MMM-yyyy').format(selectedDate),
                        style: AppTextStyle.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Title',
                        style: AppTextStyle.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                          ),
                          child: InputField(
                            textEditingController:
                                calenderCtr.titleTextController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Unvalid';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Description',
                    style: AppTextStyle.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    textEditingController:
                        calenderCtr.descriptionTextController,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: SharedButton.squareButton(
                    buttonText: 'SAVE',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        calenderCtr.saveEventFun(selectedDate.day);
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  DateTime _initializeArguments(CalenderController calenderController) {
    DateTime selectedDate = DateTime.now();
    if (Get.arguments != null) {
      if (Get.arguments is EventModel) {
        selectedDate = (Get.arguments as EventModel).dateTime!;
        calenderController.autoFillUpEditingController(Get.arguments);
      } else {
        selectedDate = Get.arguments;
        calenderController.clearEditingController();
      }
    }
    return selectedDate;
  }
}
