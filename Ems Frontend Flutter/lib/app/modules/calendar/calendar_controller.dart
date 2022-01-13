import 'dart:async';

import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/core/utils/constants/constants.dart';
import 'package:adnems/app/data/models/calander_event.dart';
import 'package:adnems/app/data/models/user_summary.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CalendarEventController extends GetxController {
  final AuthController _authController =
      Get.find<AuthController>(tag: 'authfirst');

  late final Dio _dio;

  // observables
  final RxList<CalendarEvent> _calendarEvents =
      List<CalendarEvent>.empty(growable: true).obs;

  final RxList<UserSummary> _employees =
      List<UserSummary>.empty(growable: true).obs;

  final _eventLoaded = false.obs;
  final _eventCreating = false.obs;

  final _isAssigned = false.obs;
  final _isDayLong = false.obs;
  late Rx<DateTime> _startDate;

  final RxList<String> _eventTypes = [
    'public',
    'private',
    'assigned',
  ].obs;
  ////

  @override
  Future<void> onInit() async {
    super.onInit();
    _dio = Dio();
    _startDate = DateTime.now().obs;

    retriveCalendarEvents();
    retriveEmployeeSummary();
  }

  int get user => int.parse(_authController.user.id);

  List<CalendarEvent> get calendarEvents => _calendarEvents;

  List<UserSummary> get employees => _employees;

  List<String> get eventTypes => _eventTypes;

  bool get eventLoaded => _eventLoaded.value;
  void setEventLoaded(load) => _eventLoaded.value = load;

  bool get eventCreating => _eventCreating.value;
  void setEventCreating(load) => _eventCreating.value = load;

  bool get isAssigned => _isAssigned.value;
  void setIsAssigned(load) => _isAssigned.value = load;

  bool get isDayLong => _isDayLong.value;
  void setIsDayLong(load) => _isDayLong.value = load;

  DateTime get startDate => _startDate.value;
  void setStartDate(value) => _startDate.value = value;

  List<String> getEventTypes() {
    if (_authController.user.grade.compareTo('C') <= 0 ||
        _authController.user.email == 'nafiz.pervez@mastodonbd.com') {
      return eventTypes;
    }
    if (_authController.user.grade.compareTo('L') < 0) {
      return [
        'private',
        'assigned',
      ];
    } else {
      return [
        'private',
      ];
    }
  }

  Future<void> retriveEmployeeSummary() async {
    try {
      _dio
          .get(
        '${Constants.baseApiUrl}information/all_user_summary',
        options: Options(
          headers: {'Authorization': 'Bearer ${_authController.token}'},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            employees.clear();
            value.data['data'].map(
              (empData) {
                final UserSummary _emp = UserSummary.fromJson(empData);
                employees.add(_emp);
              },
            ).toList();
          } else {
            Get.dialog(
              const AlertDialog(
                title: Text('Server Error'),
              ),
            );
          }
        },
      );
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Server Error'),
        ),
      );
    }
  }

  Future<void> retriveCalendarEvents() async {
    setEventLoaded(false);
    Future.delayed(
      const Duration(
        milliseconds: 20,
      ),
    ).whenComplete(
      () {
        try {
          _dio
              .get(
            '${Constants.baseApiUrl}calendar_events',
            options: Options(
              headers: {'Authorization': 'Bearer ${_authController.token}'},
            ),
          )
              .then(
            (value) {
              if (value.statusCode == 200) {
                _calendarEvents.clear();
                value.data['data'].map(
                  (calEvData) {
                    final CalendarEvent _calEv =
                        CalendarEvent.fromJson(calEvData);
                    calendarEvents.add(_calEv);
                  },
                ).toList();
              } else {
                Get.dialog(
                  const AlertDialog(
                    title: Text('Server Error'),
                  ),
                );
              }
            },
          ).whenComplete(
            () => setEventLoaded(true),
          );
        } catch (e) {
          Get.dialog(
            const AlertDialog(
              title: Text('Server Error'),
            ),
          );
          setEventLoaded(true);
        }
      },
    );
  }

  Future<void> createCalendarEvent(Map<String, dynamic> calEvData) async {
    setEventCreating(true);
    final fromd = FormData.fromMap(calEvData);

    Options options = Options(
      headers: {
        'Authorization': 'Bearer ${_authController.token}',
      },
    );

    try {
      _dio
          .post(
        '${Constants.baseApiUrl}calendar_events',
        data: fromd,
        options: options,
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            final CalendarEvent _calEv = CalendarEvent.fromJson(value.data);
            calendarEvents.add(_calEv);
            Get.reload;
            Get.close(1);
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
                    'An Event has been Successfully Created',
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
            setEventCreating(false);
          }
        },
      ).whenComplete(
        () => setEventCreating(false),
      );
    } catch (e) {
      Get.dialog(
        const AlertDialog(
          title: Text('Server Error'),
        ),
      );
      setEventCreating(false);
    }
  }

  List<Meeting> getDataSource() {
    return List<Meeting>.generate(
      calendarEvents.length,
      (index) => Meeting(
        calendarEvents[index].title + ': ' + calendarEvents[index].description,
        calendarEvents[index].from,
        calendarEvents[index].to,
        getEventColor(
          calendarEvents[index].eventType,
          calendarEvents[index].createdBy.employeeId,
        ),
        calendarEvents[index].dayLongEvent,
      ),
    );
  }

  List<UserSummary> getAssignables() {
    return employees
        .where((element) =>
            element.grade.compareTo(_authController.user.grade) > 0)
        .toList();
  }

  getEventColor(String eventType, String createdBy) {
    switch (eventType) {
      case 'public':
        return Colors.green.withOpacity(0.8);
      case 'private':
        return Colors.indigo.withOpacity(0.8);
      case 'assigned':
        if (_authController.user.employeeId == createdBy) {
          return Colors.blueAccent.withOpacity(0.8);
        } else {
          return Colors.lightBlue.withOpacity(0.8);
        }
      default:
        return ADNColorConstants.kADNLighterGreen;
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
