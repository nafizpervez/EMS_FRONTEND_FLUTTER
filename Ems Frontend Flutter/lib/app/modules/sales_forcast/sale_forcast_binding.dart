import 'package:get/get.dart';

import 'sale_forcast_controller.dart';

class SaleForcastBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleForcastController>(
      () => SaleForcastController(),
    );
  }
}
