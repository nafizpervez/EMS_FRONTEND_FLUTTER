import 'package:adnems/app/modules/conveyence/conveyance_controller.dart';
import 'package:adnems/app/modules/leave/leave_controller.dart';
import 'package:adnems/app/modules/pr/pr_controller.dart';
import 'package:get/get.dart';

import 'approval_controller.dart';

class ApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(
      () => LeaveController(),
    );
    Get.lazyPut<PRController>(
      () => PRController(),
    );
    Get.lazyPut<ConveyanceController>(
      () => ConveyanceController(),
    );
    Get.lazyPut<ApprovalController>(
      () => ApprovalController(),
    );
  }
}
