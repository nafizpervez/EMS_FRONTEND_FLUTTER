import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EmployeeController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<User> _employees = List<User>.empty(growable: true).obs;
  final _isLoaded = false.obs;
  final _searchTerm = ''.obs;
  final _searchBy = 'name'.obs;
  final RxList<String> _searchTypes = [
    'name',
    'designation',
    'grade',
    'division',
    'department',
    'unit',
    'sub unit',
    'location',
    'blood group',
  ].obs;

  PlatformFile? _attachment;

  final _employeeUpdating = false.obs;
  ////

  @override
  void onInit() async {
    super.onInit();
    _dio = Dio();
    setSearchTerm('');

    await getEmployees();
  }

  set employees(value) => _employees.value = value;

  PlatformFile? get attachment => _attachment;
  void setAttachment(value) => _attachment = value;

  List<User> get employees => _employees;

  List<String> get searchTypes => _searchTypes;

  setIsloaded(loaded) => _isLoaded.value = loaded;
  bool get isloaded => _isLoaded.value;

  setSearchTerm(term) => _searchTerm.value = term;
  String get searchTerm => _searchTerm.value;

  setSearchBy(term) => _searchBy.value = term;
  String get searchBy => _searchBy.value;

  bool get employeeUpdating => _employeeUpdating.value;
  void setEmployeeUpdating(load) => _employeeUpdating.value = load;

  Future<void> getEmployees() async {
    setIsloaded(false);
    _dio
        .get(
      '${Constants.baseApiUrl}users',
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          _employees.clear();
          value.data['data'].map(
            (value) {
              final User _emp = User.fromJson(value);
              _employees.add(_emp);
            },
          ).toList();
          _employees.sort((empA, empB) => empA.name.compareTo(empB.name));
        } else {
          print(value.statusMessage);
        }
      },
    ).whenComplete(
      () => setIsloaded(true),
    );
  }

  Future<void> updateEmployee(
      Map<String, dynamic> updatableData, User employee) async {
    setEmployeeUpdating(true);
    final fromd = FormData.fromMap(updatableData);

    if (attachment != null) {
      fromd.files.add(
        MapEntry(
          'avater',
          MultipartFile.fromBytes(attachment!.bytes!, filename: 'avater'),
        ),
      );
      fromd.fields.add(
        MapEntry('attachment_type', attachment!.extension!),
      );
    }

    Options options = Options(
      contentType: 'multipart/form-data',
      headers: {
        'Authorization': 'Bearer ${_authController.token}',
      },
    );

    try {
      await _dio
          .post(
        '${Constants.baseApiUrl}update/users/' + employee.id,
        data: fromd,
        options: options,
      )
          .then((value) {
        if (value.statusCode == 200) {
          final User _emp = User.fromJson(value.data);
          employees[employees.indexWhere((element) => element.id == _emp.id)] =
              _emp;
          Get.offNamed(Routes.EMPLOYEES);
        } else {
          setEmployeeUpdating(false);
          Get.snackbar('Error!', 'Data Could not be Updated.');
        }
      }).whenComplete(() {
        setSearchTerm('');
        setSearchBy('name');
        setEmployeeUpdating(false);
      });
    } catch (e) {
      setEmployeeUpdating(false);
      Get.snackbar('Error!', 'Data Could not be Updated.');
    }
  }

  Future<void> deactivateEmployeeAccount(String id) async {
    try {
      _dio
          .put(
        '${Constants.baseApiUrl}users/deactivate/' + id,
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final User _emp = User.fromJson(value.data);
            _employees.removeWhere((element) => element.id == id);
            _employees.add(_emp);
          } else {
            print(value.statusMessage);
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> activateEmployeeAccount(String id) async {
    try {
      _dio
          .put(
        '${Constants.baseApiUrl}users/activate/' + id,
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final User _emp = User.fromJson(value.data);
            _employees.removeWhere((element) => element.id == id);
            _employees.add(_emp);
          } else {
            print(value.statusMessage);
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  List<User> searchedEmployee() {
    if (searchTerm != '') {
      var searchEmps;
      switch (searchBy) {
        case 'name':
          searchEmps = employees.where(
            (element) =>
                element.name.toLowerCase().contains(searchTerm.toLowerCase()),
          );
          break;
        case 'designation':
          searchEmps = employees.where(
            (element) => element.designation
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        case 'grade':
          searchEmps = employees.where(
            (element) =>
                element.grade.toLowerCase().contains(searchTerm.toLowerCase()),
          );
          break;
        case 'division':
          searchEmps = employees.where(
            (element) => element.division
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        case 'department':
          searchEmps = employees.where(
            (element) => element.department
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        case 'unit':
          searchEmps = employees.where(
            (element) =>
                element.unit.toLowerCase().contains(searchTerm.toLowerCase()),
          );
          break;
        case 'location':
          searchEmps = employees.where(
            (element) => element.location
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        case 'sub unit':
          searchEmps = employees.where(
            (element) => element.subUnit
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        case 'blood group':
          searchEmps = employees.where(
            (element) => element.bloodGroup
                .toLowerCase()
                .contains(searchTerm.toLowerCase()),
          );
          break;
        default:
          searchEmps = employees.where(
            (element) =>
                element.name.toLowerCase().contains(searchTerm.toLowerCase()),
          );
          break;
      }

      return searchEmps.toList();
    } else {
      return employees;
    }
  }

  bool canEditEmployeeInfo() {
    if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    }
    if (_authController.user.department.toLowerCase() == 'human resources') {
      return true;
    }
    return false;
  }
}
