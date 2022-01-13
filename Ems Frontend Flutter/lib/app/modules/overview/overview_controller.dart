import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/alloted_leave_detail.dart';
import 'package:adnems/app/data/models/announcement.dart';
import 'package:adnems/app/data/models/funnel_info.dart';
import 'package:adnems/app/global/widgets/chart_data.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OverviewController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final employeeCount = '0'.obs;
  final funnelInfos = List<FunnelInfo>.empty(growable: true).obs;
  final leaveInfos = List<ChartData>.empty(growable: true).obs;
  final announcements = List<Announcement>.empty(growable: true).obs;
  final funnelLoaded = false.obs;
  final leaveLoaded = false.obs;
  final empCountLoaded = false.obs;
  final announceLoaded = false.obs;
  ////

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
    await getCount();
    await getFunnelInfos();
    await getLeaveInfo();
    await getAnnouncement();
  }

  AllotedLeaveDetail? get allotedLeave =>
      _authController.user.allotedLeaveDetail;

  Future<void> getCount() async {
    empCountLoaded.value = false;
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}information/employee_count',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            employeeCount.value = value.data['employee_count'];
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => empCountLoaded.value = true,
      );
    } catch (e) {
      employeeCount.value = 'No Data';
      empCountLoaded.value = true;
    }
  }

  Future<void> getFunnelInfos() async {
    funnelLoaded.value = false;
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}information/funnel_project_val',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            funnelInfos.clear();
            value.data['data'].map(
              (value) {
                final FunnelInfo _emp = FunnelInfo.fromJson(value);
                funnelInfos.add(_emp);
              },
            ).toList();
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => funnelLoaded.value = true,
      );
    } catch (e) {
      funnelLoaded.value = true;
    }
  }

  Future<void> getLeaveInfo() async {
    leaveLoaded.value = false;
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}information/on_leave',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            leaveInfos.clear();
            final ChartData _abs = ChartData(
                'On Leave', value.data['absense'], ADNColorConstants.kADNGray);
            leaveInfos.add(_abs);
            final ChartData _pres = ChartData(
              'Presence',
              value.data['presence'],
              ADNColorConstants.kADNLightGreen,
            );
            leaveInfos.add(_pres);
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => leaveLoaded.value = true,
      );
    } catch (e) {
      leaveLoaded.value = true;
    }
  }

  Future<void> getAnnouncement() async {
    announceLoaded.value = false;
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}information/announcements',
        options: Options(
          headers: {'authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            announcements.clear();
            value.data['announcements']
                .map(
                  (value) => announcements.add(
                    Announcement.fromJson(value),
                  ),
                )
                .toList();
          } else {
            print(value.statusMessage);
          }
        },
      ).whenComplete(
        () => announceLoaded.value = true,
      );
    } catch (e) {
      announceLoaded.value = true;
    }
  }
}
