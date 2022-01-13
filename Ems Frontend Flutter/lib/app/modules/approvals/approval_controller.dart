import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ApprovalController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
  }

  Future<void> updateApproval(ApprovalRequest approval) async {
    try {
      Options options = Options(
        headers: {
          'Authorization': 'Bearer ${_authController.token}',
        },
      );

      _dio
          .put(
        '${Constants.baseApiUrl}approval_requests/' + approval.id,
        data: approval.toJson(),
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
          } else {
            print(value.statusCode.toString() +
                ' ' +
                value.statusMessage.toString());
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
