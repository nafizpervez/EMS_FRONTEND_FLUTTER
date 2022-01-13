import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/data/models/conveyance.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ConveyanceController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<Conveyance> _conveyances =
      List<Conveyance>.empty(growable: true).obs;

  final RxList<String> _conveyanceTypes = [
    'transportation',
    'overtime',
    'holiday',
  ].obs;
  final RxList<Map<String, String>> _lineManagers = [
    {"person": 'Faridul Hasan Shuvo', "employee_id": '2010160'},
    {"person": 'Kazi Masum Hossain', "employee_id": '2010117'},
    {"person": 'Fahim Khandoker', "employee_id": '2010174'},
    {"person": 'Md. Shahriyar Alam', "employee_id": '2010173'},
    {"person": 'Mohammad Ripon', "employee_id": '2010006'},
  ].obs;
  final RxInt _totalTime = 0.obs;
  final _inTime = DateTime.now().obs;
  final _outTime = DateTime.now().obs;

  final _conveyanceLoaded = false.obs;
  final _conveyanceCreating = false.obs;
  // //

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();

    retriveConveyances();
  }

  String get totalTime => _totalTime.value.toString();
  void setTotalTime(value) => _totalTime.value = value;

  DateTime get inTime => _inTime.value;
  void setInTime(value) => _inTime.value = value;

  DateTime get outTime => _outTime.value;
  void setOutTime(value) => _outTime.value = value;

  List<Conveyance> get conveyance => _conveyances;

  List<String> get conveyanceTypes => _conveyanceTypes;
  List<Map<String, String>> get lineManagers => _lineManagers;

  bool get conveyanceLoaded => _conveyanceLoaded.value;
  void setConveyanceLoaded(load) => _conveyanceLoaded.value = load;

  bool get conveyanceCreating => _conveyanceCreating.value;
  void setConveyanceCreating(load) => _conveyanceCreating.value = load;

  Future<void> retriveConveyances() async {
    setConveyanceLoaded(false);
    Future.delayed(
      const Duration(
        milliseconds: 20,
      ),
    ).whenComplete(
      () {
        try {
          _dio
              .get(
            '${Constants.baseApiUrl}conveyances',
            options: Options(
              headers: {'Authorization': 'Bearer ${_authController.token}'},
            ),
          )
              .then(
            (value) {
              if (value.statusCode == 200) {
                _conveyances.clear();
                value.data['data'].map(
                  (convData) {
                    final Conveyance _conv = Conveyance.fromJson(convData);
                    _conveyances.add(_conv);
                  },
                ).toList();
              } else {
                print(value.statusMessage);
              }
            },
          ).whenComplete(
            () => setConveyanceLoaded(true),
          );
        } catch (e) {
          Get.dialog(
            const AlertDialog(
              title: Text('Server Error'),
            ),
          );
          setConveyanceLoaded(true);
        }
      },
    );
  }

  Future<void> createConveyance(Map<String, dynamic> convData) async {
    print(convData);
    setConveyanceCreating(true);
    final fromd = FormData.fromMap(convData);

    try {
      _dio
          .post(
        '${Constants.baseApiUrl}conveyances',
        data: fromd,
        options: Options(
          headers: {'Authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final Conveyance _conveyance = Conveyance.fromJson(value.data);
            _conveyances.add(_conveyance);
            Get.reload;
            Get.offNamed(Routes.OVERVIEW);
            Get.dialog(
              FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: AlertDialog(
                  title: const Text(
                    'Success',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    'Your request has been succesfully submitted',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                    ),
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
          } else {
            Get.dialog(
              const AlertDialog(
                title: Text('Request Error'),
              ),
            );
            setConveyanceCreating(false);
          }
        },
      ).whenComplete(
        () => setConveyanceCreating(false),
      );
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Server Error'),
        ),
      );
      setConveyanceCreating(false);
    }
  }

  Future<void> deleteConveyance(Conveyance conv) async {
    try {
      _dio
          .delete(
        '${Constants.baseApiUrl}conveyances/${conv.id}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_authController.token}',
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            Get.dialog(
              FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: AlertDialog(
                  title: const Text(
                    'Record Deletion!',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    'The Conveyance Reocord has been Deleted Successfully',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                    ),
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
            retriveConveyances();
            Get.offNamed(Routes.APPROVAL);
          } else {
            Get.dialog(
              FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: AlertDialog(
                  title: const Text(
                    'Record Deletion!',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    children: [
                      const Text(
                        'Sorry! We could not Destroy the Conveyance Record',
                        style: TextStyle(
                          color: ADNColorConstants.kADNWhite,
                        ),
                      ),
                      Text(value.data['errors'].toString()),
                    ],
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      Get.dialog(
        FadeInDown(
          duration: const Duration(milliseconds: 300),
          child: AlertDialog(
            title: const Text(
              'Record Deletion!',
              style: TextStyle(
                color: ADNColorConstants.kADNWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Failed to delete the Record',
              style: TextStyle(
                color: ADNColorConstants.kADNWhite,
              ),
            ),
            backgroundColor: ADNColorConstants.kADNLightGreen.withOpacity(0.7),
          ),
        ),
      );
    }
  }

  ApprovalRequest? getApproval(Conveyance conv) {
    try {
      return conv.approvals
          .where(
            (element) =>
                element.needApprovalFrom.employeeId ==
                    _authController.user.employeeId &&
                element.canApprove,
          )
          .first;
    } catch (e) {
      return null;
    }
  }

  List<Conveyance> getConveyances() {
    return conveyance.where((element) => canSeeApplication(element)).toList();
  }

  bool canSeeApplication(Conveyance conv) {
    for (var appv in conv.approvals) {
      if (appv.needApprovalFrom.employeeId == _authController.user.employeeId) {
        return true;
      }
    }

    if (conv.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {
      return false;
    }
  }

  bool canSeeEdit(List<ApprovalRequest> approvals) {
    approvals.sort((a, b) => b.line.compareTo(a.line));
    final approvalMax = approvals.first;
    if (approvalMax.needApprovalFrom.id == _authController.user.id) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {}
    return false;
  }

  bool canSeeDelete(Conveyance conv) {
    if (conv.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {}
    return false;
  }
}
