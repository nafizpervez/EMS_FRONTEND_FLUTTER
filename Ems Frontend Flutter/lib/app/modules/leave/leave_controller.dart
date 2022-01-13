import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/alloted_leave_detail.dart';
import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/data/models/leave.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LeaveController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<Leave> _leaves = List<Leave>.empty(growable: true).obs;
  final RxList<String> _leaveTypes = [
    'sick',
    'annual',
    'unpaid',
    'maternity',
  ].obs;
  final RxList<Map<String, String>> _lineManagers = [
    {"person": 'Faridul Hasan Shuvo', "employee_id": '2010160'},
    {"person": 'Kazi Masum Hossain', "employee_id": '2010117'},
    {"person": 'Fahim Khandoker', "employee_id": '2010174'},
    {"person": 'Md. Shahriyar Alam', "employee_id": '2010173'},
    {"person": 'Mohammad Ripon', "employee_id": '2010006'},
  ].obs;
  final RxInt _totalDays = 0.obs;
  final _startDate = DateTime.now().obs;
  final _endDate = DateTime.now().obs;
  PlatformFile? _attachment;

  final _leaveLoaded = false.obs;
  final _leaveCreating = false.obs;
  // //

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
    _attachment = null;

    retriveLeaves();
  }

  List<String> get leaveTypes => _leaveTypes;
  List<Map<String, String>> get lineManagers => _lineManagers;

  String get totalDays => _totalDays.value.toString();
  void setTotalDays(value) => _totalDays.value = value;

  DateTime get startDate => _startDate.value;
  void setStartDate(value) => _startDate.value = value;

  DateTime get endDate => _endDate.value;
  void setEndDate(value) => _endDate.value = value;

  PlatformFile? get attachment => _attachment;
  void setAttachment(value) => _attachment = value;

  List<Leave> get leaves => _leaves;

  bool get leaveLoaded => _leaveLoaded.value;
  void setLeaveLoaded(load) => _leaveLoaded.value = load;

  bool get leaveCreating => _leaveCreating.value;
  void setLeaveCreating(load) => _leaveCreating.value = load;

  Future<void> retriveLeaves() async {
    setLeaveLoaded(false);
    Future.delayed(
      const Duration(
        milliseconds: 20,
      ),
    ).whenComplete(
      () {
        try {
          _dio
              .get(
            '${Constants.baseApiUrl}leaves',
            options: Options(
              headers: {'Authorization': 'Bearer ${_authController.token}'},
            ),
          )
              .then(
            (value) {
              if (value.statusCode == 200) {
                _leaves.clear();
                value.data['data'].map(
                  (leaveData) {
                    final Leave _leave = Leave.fromJson(leaveData);
                    _leaves.add(_leave);
                  },
                ).toList();
              } else {
                print(value.statusMessage);
              }
            },
          ).whenComplete(
            () => setLeaveLoaded(true),
          );
        } catch (e) {
          Get.dialog(
            const AlertDialog(
              title: Text('Server Error'),
            ),
          );
          setLeaveLoaded(true);
        }
      },
    );
  }

  Future<void> createLeave(Map<String, dynamic> leaveData) async {
    setLeaveCreating(true);
    final fromd = FormData.fromMap(leaveData);

    if (attachment != null) {
      fromd.files.add(
        MapEntry(
          'attachment',
          MultipartFile.fromBytes(attachment!.bytes!, filename: 'leaveFile'),
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
      _dio
          .post(
        '${Constants.baseApiUrl}leaves',
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final Leave _leave = Leave.fromJson(value.data);

            _leaves.add(_leave);
            Get.reload;
            Get.offNamed(Routes.OVERVIEW);
            Get.snackbar(
              'Success',
              'Your request has been succesfully submitted',
            );
          } else {
            Get.dialog(
              const AlertDialog(
                title: Text('Request Error'),
              ),
            );
            setLeaveCreating(false);
          }
        },
      ).whenComplete(
        () => setLeaveCreating(false),
      );
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Server Error'),
        ),
      );
      setLeaveCreating(false);
    }
  }

  Future<void> deleteLeave(Leave lv) async {
    try {
      _dio
          .delete(
        '${Constants.baseApiUrl}leaves/${lv.id}',
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
                    'The Leave Reocord has been Deleted Successfully',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                    ),
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
            retriveLeaves();
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
                        'Sorry! We could not Destroy the Leave Record',
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

  List<Leave> getLeaves() {
    return leaves.where((element) => canSeeApplication(element)).toList();
  }

  ApprovalRequest? getApproval(Leave leave) {
    try {
      return leave.approvals
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

  bool canSeeApplication(Leave leave) {
    for (var appv in leave.approvals) {
      if (appv.needApprovalFrom.employeeId == _authController.user.employeeId) {
        return true;
      }
    }

    if (leave.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.department.toLowerCase() ==
        'human resources') {
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

  bool canSeeDelete(Leave lv) {
    final pendCount = lv.approvals
        .where(
          (element) =>
              element.status == 'approved' || element.status == 'rejected',
        )
        .length;

    if (pendCount > 0) {
      return false;
    }

    if (lv.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {}
    return false;
  }
}
