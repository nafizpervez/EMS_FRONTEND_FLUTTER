import 'package:adnems/app/modules/auth/login/auth_binding.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/modules/auth/login/login_screen.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DashMiddleware extends GetMiddleware {
  final AuthController _authController = Get.find<AuthController>(
    tag: 'authfirst',
  );

  @override
  GetPage? onPageCalled(GetPage? page) {
    if (_authController.authenticated) {
      return super.onPageCalled(page);
    } else {
      return super.onPageCalled(
        GetPage(
          title: 'Login',
          name: Routes.LOGIN,
          binding: AuthBinding(),
          page: () => const LoginScreen(),
        ),
      );
    }
  }
}
