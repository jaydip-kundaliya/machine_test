import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controllers/calender_controller.dart';
import 'package:machine_test/services/route_service.dart';

class MachineTestApp extends StatelessWidget {
  const MachineTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: CalenderBinding(),
      getPages: RoutePages.routePages(),
      initialRoute: RoutePages.initialPage,
    );
  }
}
