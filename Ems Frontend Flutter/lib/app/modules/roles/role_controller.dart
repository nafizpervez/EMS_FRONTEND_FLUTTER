import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/role.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ControllerController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  final RxList<Role> _roles = List<Role>.empty(growable: true).obs;

// final MyRepository repository;
// EmployeeController(this.repository);

  @override
  void onInit() async {
    super.onInit();
    _dio = Dio();

    await getRoles();
  }

  set roles(value) => _roles.value = value;

  List<Role> get roles => _roles;

  Future<void> getRoles() async {
    _dio
        .get(
      '${Constants.baseApiUrl}roles',
      options: Options(
        headers: {'authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          _roles.clear();
          value.data['data'].map(
            (value) {
              final Role _emp = Role.fromJson(value);
              _roles.add(_emp);
            },
          ).toList();
        } else {
          print(value.statusMessage);
        }
      },
    );
  }

  // Future<void> removeEmployee(String id) async {
  //   _dio
  //       .delete(
  //     '${Constants.baseApiUrl}users/$id',
  //     options: Options(
  //       headers: {'authorization': 'Bearer ${_authController.token}'},
  //     ),
  //   )
  //       .then(
  //     (value) async {
  //       if (value.statusCode == 200) {
  //         await getEmployees().then(
  //           (value) => Get.reload(),
  //         );
  //       } else {
  //         print(value.statusMessage);
  //       }
  //     },
  //   );
  // }

  // Future<void> editEmployee(int id) async {
  //   print("user no. $id edit");
  //   //   _dio
  //   //       .get(
  //   //     '${Constants.baseApiUrl}users',
  //   //     options: Options(
  //   //       headers: {'authorization': 'Bearer ${_authController.token}'},
  //   //     ),
  //   //   )
  //   //       .then(
  //   //     (value) {
  //   //       if (value.statusCode == 200) {
  //   //         value.data['data'].map(
  //   //           (value) {
  //   //             // final User _emp = _employees.add(
  //   //             final User _emp = User.fromJson(value);
  //   //             // );
  //   //             _employees.add(_emp);
  //   //           },
  //   //         ).toList();
  //   //       }
  //   //     },
  //   //   );
  // }
}
