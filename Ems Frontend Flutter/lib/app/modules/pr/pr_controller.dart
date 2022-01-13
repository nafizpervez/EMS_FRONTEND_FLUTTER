import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/data/models/pr_item.dart';
import 'package:adnems/app/data/models/purchase_requisition.dart';
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

class PRController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<PurchaseRequisition> _purchaseRequisitions =
      List<PurchaseRequisition>.empty(growable: true).obs;

  final RxList<PrItem> _prItems = List<PrItem>.empty(growable: true).obs;

  final RxList<String> _purchaseTypes = [
    'international',
    'local',
    'ready_stock',
    'importation',
    'product_delivary',
    'installation',
  ].obs;
  final RxList<String> _expenseTypes = [
    'opex',
    'capex',
  ].obs;
  final RxList<Map<String, String>> _lineManagers = [
    {"person": 'Faridul Hasan Shuvo', "employee_id": '2010160'},
    {"person": 'Kazi Masum Hossain', "employee_id": '2010117'},
    {"person": 'Fahim Khandoker', "employee_id": '2010174'},
    {"person": 'Md. Shahriyar Alam', "employee_id": '2010173'},
    {"person": 'Mohammad Ripon', "employee_id": '2010006'},
  ].obs;
  final RxInt _itemCount = 1.obs;
  final RxInt _totalEstPrice = 0.obs;
  PlatformFile? _attachment;

  final _prLoaded = false.obs;
  final _prCreating = false.obs;
  // //

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
    _attachment = null;

    retrivePRs();
  }

  List<String> get purchaseTypes => _purchaseTypes;
  List<String> get expenseTypes => _expenseTypes;
  List<Map<String, String>> get lineManagers => _lineManagers;

  int get itemCount => _itemCount.value;

  String get totalEstPrice => _totalEstPrice.value.toString();
  void setTotalEstPrice(value) => _totalEstPrice.value = value;

  void setItemCount(value) => _itemCount.value = value;
  void incrementItemCount() => _itemCount.value = itemCount + 1;
  void decreamentItemCount() =>
      _itemCount.value = itemCount - 1 == 0 ? 1 : itemCount - 1;

  PlatformFile? get attachment => _attachment;
  void setAttachment(value) => _attachment = value;

  List<PurchaseRequisition> get purchaseRequisitions => _purchaseRequisitions;

  List<PrItem> get prItems => _prItems;
  void setPrItems(value) => _prItems.value = value;

  bool get prLoaded => _prLoaded.value;
  void setPRLoaded(load) => _prLoaded.value = load;

  bool get prCreating => _prCreating.value;
  void setPRCreating(load) => _prCreating.value = load;

  Future<void> retrivePRs() async {
    setPRLoaded(false);
    Future.delayed(
      const Duration(
        milliseconds: 20,
      ),
    ).whenComplete(
      () {
        try {
          _dio
              .get(
            '${Constants.baseApiUrl}purchase_requisitions',
            options: Options(
              headers: {'Authorization': 'Bearer ${_authController.token}'},
            ),
          )
              .then(
            (value) {
              if (value.statusCode == 200) {
                _purchaseRequisitions.clear();
                value.data['data'].map(
                  (prData) {
                    final PurchaseRequisition _pr =
                        PurchaseRequisition.fromJson(prData);
                    _purchaseRequisitions.add(_pr);
                  },
                ).toList();
              } else {
                print(value.statusMessage);
              }
            },
          ).whenComplete(
            () => setPRLoaded(true),
          );
        } catch (e) {
          Get.dialog(
            const AlertDialog(
              title: Text('Server Error'),
            ),
          );
          setPRLoaded(true);
        }
      },
    );
  }

  Future<void> createPR(Map<String, dynamic> prData) async {
    setPRCreating(true);
    final fromd = FormData.fromMap(prData);

    if (attachment != null) {
      fromd.files.add(
        MapEntry(
          'attachment',
          MultipartFile.fromBytes(attachment!.bytes!, filename: 'prfile'),
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
        '${Constants.baseApiUrl}purchase_requisitions',
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final PurchaseRequisition _pr =
                PurchaseRequisition.fromJson(value.data);
            _purchaseRequisitions.add(_pr);
            _purchaseRequisitions.sort(
              (a, b) => a.applicationDate.compareTo(b.applicationDate),
            );
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
            Get.snackbar('Error!', 'Request Error');
            setPRCreating(false);
          }
        },
      ).whenComplete(
        () => setPRCreating(false),
      );
    } catch (e) {
      Get.snackbar('Error!', 'Server Error');
      setPRCreating(false);
    }
  }

  Future<void> updatePR(Map<String, dynamic> prData, String prID) async {
    setPRCreating(true);
    final fromd = FormData.fromMap(prData);

    Options options = Options(
      headers: {
        'Authorization': 'Bearer ${_authController.token}',
      },
    );

    for (var item in fromd.fields) {
      print(item.key + ' => ' + item.value);
    }

    try {
      _dio
          .post(
        '${Constants.baseApiUrl}update/purchase_requisitions/' + prID,
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final PurchaseRequisition _pr =
                PurchaseRequisition.fromJson(value.data);
            _purchaseRequisitions.add(_pr);
            _purchaseRequisitions.sort(
              (a, b) => a.applicationDate.compareTo(b.applicationDate),
            );
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
                    'The PR Data has been succesfully updated',
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
            setPRCreating(false);
          }
        },
      ).whenComplete(
        () => setPRCreating(false),
      );
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Server Error'),
        ),
      );
      setPRCreating(false);
    }
  }

  Future<void> deletePR(PurchaseRequisition pr) async {
    try {
      _dio
          .delete(
        '${Constants.baseApiUrl}purchase_requisitions/${pr.id}',
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
                    'The Purchase Requisition Reocord has been Deleted Successfully',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                    ),
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
            retrivePRs();
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
                        'Sorry! We could not Destroy the Purchase Requisition Record',
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

  ApprovalRequest? getApproval(PurchaseRequisition pr) {
    try {
      return pr.approvals
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

  List<PurchaseRequisition> getPRs() {
    return purchaseRequisitions
        .where((element) => canSeeApplication(element))
        .toList();
  }

  bool canSeeApplication(PurchaseRequisition pr) {
    for (var appv in pr.approvals) {
      if (appv.needApprovalFrom.employeeId == _authController.user.employeeId) {
        return true;
      }
    }

    if (pr.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.department.toLowerCase() == 'scm') {
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

  bool canSeeDelete(PurchaseRequisition pr) {
    if (pr.applicant.employeeId == _authController.user.employeeId) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {}
    return false;
  }
}
