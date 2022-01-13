import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/extended_detail.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dio/dio.dart';

class ProfileController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observable
  late Rx<User> _user;
  late final Rx<ExtendedDetail> _extendedDetail = ExtendedDetail(
    id: 'id',
    employmentTerm: 'employmentTerm',
    bankAccountForSalary: 'bankAccountForSalary',
    bankName: 'bankName',
    isTwoFactorAuth: false,
    supervisor: 'supervisor',
    insuranceCategory: 'insuranceCategory',
    tin: 0,
    pfCode: 0,
    pfContribution: 0,
    dateOfBirth: 'dateOfBirth',
    maritalStatus: 'maritalStatus',
    fathersName: 'fathersName',
    mothersName: 'mothersName',
    spouseName: 'spouseName',
    nationality: 'nationality',
    nid: 0,
    gender: 'gender',
    religion: 'religion',
    numberOfChild: 0,
    passportNumber: 'passportNumber',
    mailingAddress: 'mailingAddress',
    personalEmail: 'personalEmail',
    personalContactNumber: 'personalContactNumber',
    emergencyContactNumber: 'emergencyContactNumber',
    permanentAddress: 'permanentAddress',
    officialIntercomExtension: 'officialIntercomExtension',
    skypeId: 'skypeId',
    facebookId: 'facebookId',
    twitterId: 'twitterId',
    linkedinId: 'linkedinId',
    sscEquivalent: 'sscEquivalent',
    hscEquivalent: 'hscEquivalent',
    graduation: 'graduation',
    postGraduation: 'postGraduation',
    sscFromSchool: 'sscFromSchool',
    hscFromCollege: 'hscFromCollege',
    gradUniversity: 'gradUniversity',
    postGradUniversity: 'postGradUniversity',
    professionalCertification: 'professionalCertification',
    socialAfiliation: 'socialAfiliation',
    professionalAfiliation: 'professionalAfiliation',
    habits: 'habits',
    awardAchievements: 'awardAchievements',
    totalJobExperience: 'totalJobExperience',
  ).obs;
  final _eDLoaded = false.obs;

  PlatformFile? _attachment;

  final _profileUpdating = false.obs;
  ////

  @override
  Future<void> onInit() async {
    super.onInit();
    _user = _authController.user.obs;
    _dio = Dio();
    _attachment = null;

    await getExtendedUserDetail();
  }

  User get user => _user.value;

  PlatformFile? get attachment => _attachment;
  void setAttachment(value) => _attachment = value;

  ExtendedDetail get extendedDetail => _extendedDetail.value;
  void setExtendedDetail(value) => _extendedDetail.value = value;

  bool get eDLoaded => _eDLoaded.value;
  void setEDLoaded(value) => _eDLoaded.value = value;

  bool get profileUpdating => _profileUpdating.value;
  void setProfileUpdating(load) => _profileUpdating.value = load;

  Future<void> getExtendedUserDetail() async {
    setEDLoaded(false);
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}extended_details',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final ExtendedDetail _ed =
                ExtendedDetail.fromJson(value.data['data']);
            setExtendedDetail(_ed);
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => setEDLoaded(true),
      );
    } catch (e) {
      setEDLoaded(true);
    }
  }

  Future<void> updateProfile(Map<String, dynamic> updatableData) async {
    setProfileUpdating(true);
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
        '${Constants.baseApiUrl}update/users/' + user.id,
        data: fromd,
        options: options,
      )
          .then((value) {
        if (value.statusCode == 200) {
          final User user = User.fromJson(value.data);
          _authController.setUser(user);
          Get.reload;
          setProfileUpdating(false);
          Get.offNamed(Routes.PROFILE);
        } else {
          setProfileUpdating(false);
          Get.snackbar('Error!', 'Data Could not be Updated.');
        }
      }).whenComplete(() => setProfileUpdating(false));
    } catch (e) {
      setProfileUpdating(false);
      Get.snackbar('Error!', 'Data Could not be Updated.');
    }
  }
}
