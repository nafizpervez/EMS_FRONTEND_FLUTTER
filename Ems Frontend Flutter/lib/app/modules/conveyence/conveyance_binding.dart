import 'package:get/get.dart';

import 'conveyance_controller.dart';

class ConveyanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConveyanceController>(
      () => ConveyanceController(),
    );
  }
}
