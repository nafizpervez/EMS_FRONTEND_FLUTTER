import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/calander_event.dart';
import 'package:adnems/app/global/functions/get_datetime_format.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/calendar/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalanderEventForm extends StatefulWidget {
  final CalendarEventController calEvController;
  final CalendarEvent? event;
  const CalanderEventForm({
    Key? key,
    this.event,
    required this.calEvController,
  }) : super(key: key);

  @override
  State<CalanderEventForm> createState() => _CalanderEventFormState();
}

class _CalanderEventFormState extends State<CalanderEventForm> {
  late DateTime fromDate;
  late DateTime toDate;
  final GlobalKey<FormBuilderState> _calanderFormKey =
      GlobalKey<FormBuilderState>(debugLabel: '_calendarFormState');

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(
        const Duration(
          hours: 2,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scheController =
        ScrollController(debugLabel: 'scheScrollScroll');
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width > 410
            ? 400.0
            : MediaQuery.of(context).size.width * 0.95,
        alignment: AlignmentDirectional.center,
        child: widget.calEvController.eventCreating
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FormBuilder(
                key: _calanderFormKey,
                child: SingleChildScrollView(
                  controller: _scheController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderDropdown(
                          name: 'event_type',
                          allowClear: true,
                          focusColor: Colors.transparent,
                          decoration: inputStyle(
                            'Event Type',
                            null,
                            null,
                          ),
                          onChanged: (value) {
                            if (value == 'assigned') {
                              setState(() {
                                widget.calEvController.setIsAssigned(true);
                              });
                            } else {
                              setState(() {
                                widget.calEvController.setIsAssigned(false);
                              });
                            }
                          },
                          items: widget.calEvController
                              .getEventTypes()
                              .map(
                                (type) => DropdownMenuItem(
                                  child: Text(
                                    type.capitalize.toString(),
                                  ),
                                  value: type,
                                ),
                              )
                              .toList(),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                            ],
                          ),
                        ),
                      ),
                      widget.calEvController.isAssigned
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: FormBuilderDropdown(
                                name: 'created_for',
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                allowClear: true,
                                focusColor: Colors.transparent,
                                decoration: inputStyle(
                                  'Assign Work To',
                                  null,
                                  null,
                                ),
                                items: widget.calEvController
                                    .getAssignables()
                                    .map(
                                      (emp) => DropdownMenuItem(
                                        child: Text(
                                          emp.name.capitalize.toString(),
                                        ),
                                        value: emp.id,
                                      ),
                                    )
                                    .toList(),
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 10.0,
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderTextField(
                          name: 'title',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: inputStyle(
                            'Title',
                            const Icon(Icons.title),
                            null,
                          ),
                          textCapitalization: TextCapitalization.words,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                          ]),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderTextField(
                          name: 'description',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 5,
                          decoration: inputStyle(
                            'Description',
                            const Icon(Icons.description),
                            null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderChoiceChip(
                          name: 'day_long_event',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: inputStyle(
                            'Day Long Event?',
                            null,
                            null,
                          ),
                          initialValue: false,
                          alignment: WrapAlignment.spaceEvenly,
                          options: const [
                            FormBuilderFieldOption(
                              value: true,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text('Yes'),
                              ),
                            ),
                            FormBuilderFieldOption(
                              value: false,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text('No'),
                              ),
                            ),
                          ],
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                            ],
                          ),
                          onChanged: (value) {
                            if (value == true) {
                              setState(() {
                                widget.calEvController.setIsDayLong(true);
                              });
                            } else {
                              setState(() {
                                widget.calEvController.setIsDayLong(false);
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderDateTimePicker(
                          name: 'from',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputType: widget.calEvController.isDayLong
                              ? InputType.date
                              : InputType.both,
                          decoration: inputStyle(
                            'From',
                            const Icon(Icons.calendar_today_outlined),
                            null,
                          ),
                          firstDate: DateTime.now(),
                          initialValue: DateTime.now(),
                          enabled: true,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                            ],
                          ),
                          format: widget.calEvController.isDayLong
                              ? DateFormat("dd-MM-yyyy")
                              : DateFormat("dd-MM-yyyy").add_jm(),
                          onChanged: (value) {
                            setState(
                              () {
                                widget.calEvController.setStartDate(
                                  value!.add(
                                    const Duration(hours: 1),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: FormBuilderDateTimePicker(
                          name: 'to',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputType: widget.calEvController.isDayLong
                              ? InputType.date
                              : InputType.both,
                          decoration: inputStyle(
                            'To',
                            const Icon(Icons.calendar_today_outlined),
                            null,
                          ),
                          initialDate: widget.calEvController.startDate.add(
                            const Duration(days: 1),
                          ),
                          firstDate: widget.calEvController.startDate,
                          enabled: true,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(context),
                            ],
                          ),
                          format: widget.calEvController.isDayLong
                              ? DateFormat("dd-MM-yyyy")
                              : DateFormat("dd-MM-yyyy").add_jm(),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_calanderFormKey.currentState!.validate()) {
                            // print(_calanderFormKey.currentState!.fields);
                            final _calendarEventData = <String, dynamic>{
                              'event_type': _calanderFormKey
                                  .currentState!.fields['event_type']!.value,
                              'title': _calanderFormKey
                                  .currentState!.fields['title']!.value,
                              'description': _calanderFormKey
                                  .currentState!.fields['description']!.value,
                              'day_long_event': _calanderFormKey.currentState!
                                  .fields['day_long_event']!.value,
                            };

                            _calendarEventData.addAll(
                              {
                                'from': getDateTimeString(
                                  _calanderFormKey
                                      .currentState!.fields['from']!.value
                                      .toString(),
                                ),
                                'to': getDateTimeString(
                                  _calanderFormKey
                                      .currentState!.fields['to']!.value
                                      .toString(),
                                ),
                              },
                            );

                            if (widget.calEvController.isAssigned) {
                              _calendarEventData.addAll(
                                {
                                  'created_for': _calanderFormKey.currentState!
                                      .fields['created_for']!.value,
                                },
                              );
                            } else {
                              _calendarEventData.addAll(
                                {
                                  'created_for': widget.calEvController.user,
                                },
                              );
                            }

                            widget.calEvController
                                .createCalendarEvent(_calendarEventData);
                          }
                        },
                        icon: const Icon(Icons.send),
                        label: const Text('Add'),
                        style: ElevatedButton.styleFrom(
                          primary: ADNColorConstants.kADNLightGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
