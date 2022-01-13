import 'package:get/get.dart';

import 'pr_controller.dart';

class PRBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PRController>(
      () => PRController(),
    );
  }
}
