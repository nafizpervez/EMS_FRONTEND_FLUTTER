import 'package:adnems/app/modules/employees/employee_controller.dart';
import 'package:get/get.dart';

class EmployeeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeController>(
      () => EmployeeController(),
    );
  }
}
