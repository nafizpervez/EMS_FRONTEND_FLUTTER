import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/modules/calendar/calendar_controller.dart';
import 'package:adnems/app/modules/calendar/local_widgets/calander_event_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderIndex extends StatelessWidget {
  const CalenderIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalendarController _calendarController = CalendarController();
    return Container(
      child: GetX<CalendarEventController>(
        builder: (calEvController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Add Event'),
                      content: CalanderEventForm(
                        calEvController: calEvController,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: ADNColorConstants.kADNWhite,
                ),
                label: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add New',
                    style: TextStyle(
                      color: ADNColorConstants.kADNWhite,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => ADNColorConstants.kADNLightGreen,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SfCalendar(
                  controller: _calendarController,
                  initialSelectedDate: DateTime.now(),
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(
                    calEvController.getDataSource(),
                  ),
                  monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                  ),
                  allowedViews: const [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.month,
                    CalendarView.schedule,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
