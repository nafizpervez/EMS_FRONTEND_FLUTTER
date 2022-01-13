import 'package:get/get.dart';

import 'calendar_controller.dart';

class CalendarEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarEventController>(
      () => CalendarEventController(),
    );
  }
}
