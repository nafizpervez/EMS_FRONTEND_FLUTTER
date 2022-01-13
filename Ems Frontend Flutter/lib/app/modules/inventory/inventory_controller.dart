import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/inventory.dart';
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
import 'package:intl/intl.dart';

class InventoryController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<Inventory> _inventories =
      List<Inventory>.empty(growable: true).obs;
  final _stockLoaded = false.obs;
  final _stockCreating = false.obs;

  final _perUnitPrice = 0.obs;
  final _physicallyFoundValue = 0.obs;
  final _salesValue = 0.obs;
  final _purchaseValue = 0.obs;
  final _stockValueToBeReported = 0.obs;
  final _excessValue = 0.obs;
  final _shortageValue = 0.obs;

  PlatformFile? _attachment;
  // //

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();

    retriveInventories();
  }

  List<Inventory> get inventories => _inventories;

  PlatformFile? get attachment => _attachment;
  void setAttachment(value) => _attachment = value;

  bool get stockLoaded => _stockLoaded.value;
  void setStockLoaded(load) => _stockLoaded.value = load;

  String get perUnitPrice => NumberFormat.simpleCurrency(name: 'BDT').format(
        _perUnitPrice.value * _perUnitPrice.value,
      );
  void setPerUnitPrice(load) => _perUnitPrice.value = load;

  String get physicallyFoundValue =>
      NumberFormat.simpleCurrency(name: 'BDT').format(
        _physicallyFoundValue.value * _perUnitPrice.value,
      );
  void setPhysicallyFoundValue(load) => _physicallyFoundValue.value = load;

  String get salesValue => NumberFormat.simpleCurrency(name: 'BDT').format(
        _salesValue.value * _perUnitPrice.value,
      );
  void setSalesValue(load) => _salesValue.value = load;

  String get purchaseValue => NumberFormat.simpleCurrency(name: 'BDT').format(
        _purchaseValue.value * _perUnitPrice.value,
      );
  void setPurchaseValue(load) => _purchaseValue.value = load;

  String get stockValueToBeReported =>
      NumberFormat.simpleCurrency(name: 'BDT').format(
        _stockValueToBeReported.value * _perUnitPrice.value,
      );
  void setStockValueToBeReported(load) => _stockValueToBeReported.value = load;

  String get excessValue => NumberFormat.simpleCurrency(name: 'BDT').format(
        _excessValue.value * _perUnitPrice.value,
      );
  void setExcessValue(load) => _excessValue.value = load;

  String get shortageValue => NumberFormat.simpleCurrency(name: 'BDT').format(
        _shortageValue.value * _perUnitPrice.value,
      );
  void setShortageValue(load) => _shortageValue.value = load;

  bool get stockCreating => _stockCreating.value;
  void setStockCreating(load) => _stockCreating.value = load;

  Future<void> retriveInventories() async {
    setStockLoaded(false);
    _dio
        .get(
      '${Constants.baseApiUrl}inventories',
      options: Options(
        headers: {'Authorization': 'Bearer ${_authController.token}'},
      ),
    )
        .then(
      (value) {
        if (value.statusCode == 200) {
          // print(value);
          value.data['data'].map(
            (value) {
              final Inventory _inventory = Inventory.fromJson(value);
              _inventories.add(_inventory);
            },
          ).toList();
        } else {
          print(value.statusMessage);
        }
      },
    ).whenComplete(
      () => setStockLoaded(true),
    );
  }

  Future<void> createInventory(Map<String, dynamic> invData) async {
    setStockCreating(true);
    final fromd = FormData.fromMap(invData);

    if (attachment != null) {
      fromd.files.add(
        MapEntry(
          'attachment',
          MultipartFile.fromBytes(attachment!.bytes!, filename: 'invfile'),
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
        '${Constants.baseApiUrl}inventories',
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final Inventory _inv = Inventory.fromJson(value.data);
            inventories.add(_inv);
            inventories.sort(
              (a, b) => a.createdAt.compareTo(
                b.createdAt,
              ),
            );
            Get.offNamed(Routes.INVENTORY);
            Get.snackbar('Success', 'Record Added Successfully');
          } else {
            Get.snackbar('Error', 'Request Error');
            setStockCreating(false);
          }
        },
      ).whenComplete(
        () => setStockCreating(false),
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
      setStockCreating(false);
    }
  }

  Future<void> updateInventory(
    Map<String, dynamic> invData,
    String invID,
  ) async {
    setStockCreating(true);
    final fromd = FormData.fromMap(invData);

    if (attachment != null) {
      fromd.files.add(
        MapEntry(
          'attachment',
          MultipartFile.fromBytes(attachment!.bytes!, filename: 'invfile'),
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
        '${Constants.baseApiUrl}update/inventories/' + invID,
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final Inventory _inv = Inventory.fromJson(value.data);
            retriveInventories();
            Get.offNamed(Routes.INVENTORY);
            Get.snackbar('Success', 'Record Updated Successfully');
          } else {
            Get.snackbar('Error', 'Request Error');
            setStockCreating(false);
          }
        },
      ).whenComplete(
        () => setStockCreating(false),
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
      setStockCreating(false);
    }
  }

  Future<void> deleteInventory(Inventory inv) async {
    try {
      _dio
          .delete(
        '${Constants.baseApiUrl}inventories/${inv.id}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_authController.token}',
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            Get.snackbar('Success', 'Record Succesfully Deleted');
            retriveInventories();
            Get.offNamed(Routes.SALESFORCAST);
          } else {
            Get.snackbar('Error', 'Server Error');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
    }
  }

  Map<String, List<Inventory>> getGroups() {
    Map<String, List<Inventory>> inventoryGroup = {};

    for (var inventoryItem in inventories) {
      if (inventoryGroup[inventoryItem.productCategory] == null) {
        inventoryGroup[inventoryItem.productCategory] =
            List<Inventory>.empty(growable: true);
      } else {
        inventoryGroup[inventoryItem.productCategory]!.add(inventoryItem);
      }
    }

    return inventoryGroup;
  }

  bool canEditAndDelete() {
    if (_authController.user.department.toLowerCase() == 'scm') {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {
      return false;
    }
  }
}
