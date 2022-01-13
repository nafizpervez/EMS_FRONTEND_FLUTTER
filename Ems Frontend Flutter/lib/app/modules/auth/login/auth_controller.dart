import 'dart:convert';

import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/data/services/auth_service.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late final Dio _dio;

  final AuthService _authService = Get.put<AuthService>(
    AuthService(),
    tag: 'authServ',
    permanent: true,
  );

  // observables
  final _isLoggedIn = false.obs;
  final _authenticating = false.obs;
  final _loggingOut = false.obs;
  RxString error = ''.obs;
  RxString passerror = ''.obs;
  User? _user;
  String? _token;
  ////

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
    _user = null;
    _token = null;
    _isLoggedIn.value = false;
    _authService.retriveToken().then(
      (value) {
        _token = value;
        if (_token != null) {
          getUser(_token!);
          _isLoggedIn.value = true;
        }
      },
    );
  }

  bool get authenticated => _isLoggedIn.value;
  void setAuthenticated(value) => _isLoggedIn.value = value;

  bool get authenticating => _authenticating.value;
  void setAuthenticating(value) => _authenticating.value = value;

  bool get loggingOut => _loggingOut.value;
  void setLoggingOut(value) => _loggingOut.value = value;

  User get user => _user!;
  void setUser(User user) => _user = user;

  String get token => _token!;

  Future<void> changePassword(Map credentials) async {
    Get.dialog(
      const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: CircularProgressIndicator(
            color: ADNColorConstants.kADNLightGreen,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
    try {
      _dio
          .put(
        '${Constants.baseApiUrl}users/change_password/' + user.id,
        data: jsonEncode(credentials),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode != 200) {
            Get.dialog(
              const AlertDialog(
                title: Text('Error!'),
                content: Text('Please Provide valid Credentails'),
              ),
            );
          } else {
            passerror.value = '';
            Get.offNamed(Routes.OVERVIEW);
            Get.dialog(
              FadeInDown(
                duration: const Duration(milliseconds: 300),
                child: AlertDialog(
                  title: const Text(
                    'Edit Data',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    'Password Change Successful',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                    ),
                  ),
                  backgroundColor:
                      ADNColorConstants.kADNLightGreen.withOpacity(0.7),
                ),
              ),
            );
          }
        },
      ).whenComplete(() {
        Get.close(1);
      });
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Error!'),
          content: Text('Server Error Encountered'),
        ),
      );
    }
  }

  Future<void> login(Map credentials) async {
    setAuthenticating(true);
    try {
      _dio
          .post(
        '${Constants.baseApiUrl}sanctum/token',
        data: jsonEncode(credentials),
      )
          .then(
        (value) {
          if (value.statusCode != 200) {
            setAuthenticating(false);
            Get.snackbar('Login Failed', 'Wrong Creadentials');
          } else {
            if (value.data['status'] == 'error') {
              _token = null;
              setAuthenticating(false);
              Get.snackbar('Login Failed', 'Wrong Creadentials');
            } else {
              _token = value.data['token'];
              if (_token != null) {
                //Save token on local cache
                _authService.storeToken(_token!).then(
                      (value) => getUser(_token!),
                    );
              }
            }
          }
        },
      ).whenComplete(
        () => setAuthenticating(false),
      );
    } catch (e) {
      Get.close(1);
      Get.snackbar('Login Failed', 'Wrong Creadentials');
    }
  }

  Future<User?> getUser(String token) async {
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}user_auth',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode != 200) {
            Get.snackbar('Login Failed', 'Wrong Creadentials');
          } else {
            if (value.data['status'] == 'error') {
              _user = null;
              setAuthenticating(false);
              Get.snackbar('Login Failed', 'Wrong Creadentials');
            } else {
              setUser(User.fromJson(value.data['data']));

              setAuthenticated(true);

              return _user;
            }
          }
        },
      ).whenComplete(() {
        Get.offAllNamed(
          Routes.OVERVIEW,
        );
        setAuthenticating(false);
      });
    } catch (e) {
      setAuthenticating(false);
      Get.snackbar('Login Failed', 'Wrong Creadentials');
    }
  }

  Future<void> logout() async {
    if (_isLoggedIn.value) {
      setLoggingOut(true);
      try {
        _dio
            .get(
          '${Constants.baseApiUrl}user_auth/revoke',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        )
            .then(
          (value) {
            if (value.statusCode != 200) {
              setLoggingOut(false);
              Get.snackbar('Error!', 'Logout UnSuccessful');
            } else {
              setLoggingOut(false);
              cleanUp();
            }
          },
        );
      } catch (e) {
        setLoggingOut(false);
        Get.snackbar('Error!', 'Unexpected Error Encountered');
      }
    }
  }

  cleanUp() {
    _user = null;
    _token = null;
    _isLoggedIn.value = false;
    _authService.deleteToken().then(
          (value) => Get.offAllNamed(Routes.INITIAL),
        );
  }

  bool canSeeEmployeeList() {
    if (user.grade == 'A' || user.grade == 'B' || user.grade == 'C') {
      return true;
    }
    if (user.email == 'nafiz.pervez@mastodonbd.com' ||
        user.email == 'samia@mastodonbd.com') {
      return true;
    }
    if (user.department.toLowerCase() == 'human resources') {
      return true;
    }
    return false;
  }
}
