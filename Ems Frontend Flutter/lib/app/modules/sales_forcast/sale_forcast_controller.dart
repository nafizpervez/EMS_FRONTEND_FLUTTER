import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/sale_forcast.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleForcastController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<SaleForcast> _forcasts =
      List<SaleForcast>.empty(growable: true).obs;
  final _isLoaded = false.obs;
  ////

  @override
  void onInit() async {
    super.onInit();
    _dio = Dio();

    if (_forcasts.isEmpty) {
      await getForcasts();
    }
  }

  set forcasts(value) => _forcasts.value = value;

  bool get isLoaded => _isLoaded.value;
  void setIsLoaded(value) => _isLoaded.value = value;

  List<SaleForcast> get forcasts => _forcasts;

  Future<void> getForcasts() async {
    setIsLoaded(false);
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}sale_forcasts',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            _forcasts.clear();
            value.data['data'].map(
              (value) {
                final SaleForcast _emp = SaleForcast.fromJson(value);
                _forcasts.add(_emp);
              },
            ).toList();
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => setIsLoaded(true),
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
    }
  }

  Future<void> editSaleForcast(SaleForcast sf) async {
    final saleData = sf.toJson();
    try {
      _dio
          .put(
        '${Constants.baseApiUrl}sale_forcasts/${sf.id}',
        data: saleData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_authController.token}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            Get.snackbar('Success', 'Record Successfully Updated');
            getForcasts();
            Get.offNamed(
              Routes.SALESFORCAST,
              arguments: {
                'func': 'index',
              },
            );
          } else {
            Get.snackbar('Error', 'Constrains Error');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
    }
  }

  Future<void> createSaleForcast(SaleForcast sf) async {
    final saleData = sf.toJson();
    try {
      _dio
          .post(
        '${Constants.baseApiUrl}sale_forcasts',
        data: saleData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_authController.token}',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            Get.snackbar('Success', 'Record has ben successfully added');
            getForcasts();
            Get.offNamed(
              Routes.SALESFORCAST,
              arguments: {
                'func': 'index',
              },
            );
          } else {
            Get.snackbar('Error', 'Constrains Error');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
    }
  }

  Future<void> deleteSaleForcast(SaleForcast sf) async {
    try {
      _dio
          .delete(
        '${Constants.baseApiUrl}sale_forcasts/${sf.id}',
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
            getForcasts();
            Get.offNamed(Routes.SALESFORCAST);
          } else {
            Get.snackbar('Error', 'Constrains Error');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Server Error');
    }
  }

  bool canEditAndDelete(SaleForcast sf) {
    if (sf.accountManagerName
            .toLowerCase()
            .compareTo(_authController.user.name.toLowerCase()) ==
        0) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {
      return false;
    }
  }

  bool canAddNew() {
    if (_authController.user.division.toLowerCase().contains('business')) {
      return true;
    } else if (_authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return true;
    } else {
      return false;
    }
  }

  Map<String, List<SaleForcast>> getGroups() {
    Map<String, List<SaleForcast>> forcastGroup = {};

    for (var forcast in forcasts) {
      if (forcastGroup[forcast.accountManagerName] == null) {
        forcastGroup[forcast.accountManagerName] =
            List<SaleForcast>.empty(growable: true);
      } else {
        forcastGroup[forcast.accountManagerName]!.add(forcast);
      }
    }

    return forcastGroup;
  }
}
