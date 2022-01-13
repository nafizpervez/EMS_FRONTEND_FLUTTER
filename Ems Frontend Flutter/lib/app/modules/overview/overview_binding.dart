import 'package:get/get.dart';

import 'overview_controller.dart';

class OverviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OverviewController>(
      () => OverviewController(),
    );
  }
}
