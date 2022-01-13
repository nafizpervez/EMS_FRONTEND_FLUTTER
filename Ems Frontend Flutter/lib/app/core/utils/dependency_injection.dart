import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() async {
    Get.put<AuthController>(
      AuthController(),
      tag: 'authfirst',
      permanent: true,
    );
  }
}
