import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/get_datetime_format.dart';
import 'package:adnems/app/global/widgets/form_section_title.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/modules/conveyence/conveyance_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConveyanceCreate extends StatefulWidget {
  const ConveyanceCreate({Key? key}) : super(key: key);

  @override
  State<ConveyanceCreate> createState() => _ConveyanceCreateState();
}

class _ConveyanceCreateState extends State<ConveyanceCreate> {
  final AuthController authC = Get.find<AuthController>(
    tag: 'authfirst',
  );
  final GlobalKey<FormBuilderState> _conveyanceFormKey =
      GlobalKey<FormBuilderState>();

  final GlobalKey<FormFieldState> _totalField = GlobalKey<FormFieldState>();

  final ScrollController _cScr = ScrollController(debugLabel: 'convFormScroll');
  @override
  Widget build(BuildContext context) {
    return GetX<ConveyanceController>(
      builder: (convController) {
        return convController.conveyanceCreating
            ? const Center(
                child: CircularProgressIndicator(
                  color: ADNColorConstants.kADNLightGreen,
                ),
              )
            : FormBuilder(
                key: _conveyanceFormKey,
                child: SingleChildScrollView(
                  controller: _cScr,
                  child: Column(
                    children: [
                      ResponsiveUI(
                        desktop: Column(
                          children: [
                            const FormSectionTitle(
                              title: 'Personal Information',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'application_date',
                                      inputType: InputType.date,
                                      decoration: inputStyle(
                                        'Application Date',
                                        null,
                                        null,
                                      ),
                                      firstDate: DateTime.now().subtract(
                                        const Duration(days: 7),
                                      ),
                                      lastDate: DateTime.now(),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      format: DateFormat("dd-MM-yyyy"),
                                      initialValue: DateTime.now(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'name',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Name',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.name,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'designation',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Designation',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.designation,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'department',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Department',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.department,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const FormSectionTitle(
                              title: 'Conveyance Information',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDropdown(
                                      name: 'conveyance_type',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      allowClear: true,
                                      focusColor: Colors.transparent,
                                      decoration: inputStyle(
                                        'Conveyance Type',
                                        null,
                                        null,
                                      ),
                                      items: convController.conveyanceTypes
                                          .map(
                                            (type) => DropdownMenuItem(
                                              child: Text(
                                                type.toUpperCase(),
                                              ),
                                              value: type,
                                            ),
                                          )
                                          .toList(),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDropdown(
                                      name: 'line_manager_id',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      allowClear: true,
                                      focusColor: Colors.transparent,
                                      decoration: inputStyle(
                                        'Line Manager',
                                        null,
                                        null,
                                      ),
                                      items: convController.lineManagers
                                          .map(
                                            (lm) => DropdownMenuItem(
                                              child: Text(
                                                lm['person'].toString(),
                                              ),
                                              value: lm['employee_id'],
                                            ),
                                          )
                                          .toList(),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'in_time',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'In Time',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialTime: TimeOfDay.now(),
                                      inputType: InputType.time,
                                      onChanged: (value) {
                                        setState(() {
                                          convController.setInTime(value);
                                        });
                                      },
                                      format: DateFormat.jm(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'out_time',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Out Time',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      format: DateFormat.jm(),
                                      initialTime: TimeOfDay.now(),
                                      inputType: InputType.time,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            convController.setOutTime(value);
                                            _totalField.currentState!.didChange(
                                              (convController.outTime.hour -
                                                          convController
                                                              .inTime.hour)
                                                      .toString() +
                                                  ' hours',
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      key: _totalField,
                                      name: 'total_hours',
                                      enabled: false,
                                      decoration: inputStyle(
                                        'Total Time',
                                        null,
                                        null,
                                      ),
                                      initialValue: '0 hours',
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'from',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Travel From',
                                        null,
                                        null,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'to',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Travel To',
                                        null,
                                        null,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'payable_amount',
                                      decoration: inputStyle(
                                        'Payable Amount',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'details',
                                maxLines: 2,
                                decoration: inputStyle(
                                  'Details',
                                  null,
                                  null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                        phoneL: Column(
                          children: [
                            const FormSectionTitle(
                              title: 'Personal Information',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'application_date',
                                      inputType: InputType.date,
                                      decoration: inputStyle(
                                        'Application Date',
                                        null,
                                        null,
                                      ),
                                      firstDate: DateTime.now().subtract(
                                        const Duration(days: 90),
                                      ),
                                      lastDate: DateTime.now().add(
                                        const Duration(days: 30),
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      format: DateFormat("dd-MM-yyyy"),
                                      initialValue: DateTime.now(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'name',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Name',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.name,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'designation',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Designation',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.designation,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'department',
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: inputStyle(
                                        'Applicant Department',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialValue: authC.user.department,
                                      enabled: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            const FormSectionTitle(
                              title: 'Conveyance Information',
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDropdown(
                                      name: 'conveyance_type',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      allowClear: true,
                                      focusColor: Colors.transparent,
                                      decoration: inputStyle(
                                        'Conveyance Type',
                                        null,
                                        null,
                                      ),
                                      items: convController.conveyanceTypes
                                          .map(
                                            (type) => DropdownMenuItem(
                                              child: Text(
                                                type.toUpperCase(),
                                              ),
                                              value: type,
                                            ),
                                          )
                                          .toList(),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDropdown(
                                      name: 'line_manager_id',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      allowClear: true,
                                      focusColor: Colors.transparent,
                                      decoration: inputStyle(
                                        'Line Manager',
                                        null,
                                        null,
                                      ),
                                      items: convController.lineManagers
                                          .map(
                                            (lm) => DropdownMenuItem(
                                              child: Text(
                                                lm['person'].toString(),
                                              ),
                                              value: lm['employee_id'],
                                            ),
                                          )
                                          .toList(),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'in_time',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'In Time',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      initialTime: TimeOfDay.now(),
                                      inputType: InputType.time,
                                      onChanged: (value) {
                                        setState(() {
                                          convController.setInTime(value);
                                        });
                                      },
                                      format: DateFormat.jm(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderDateTimePicker(
                                      name: 'out_time',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Out Time',
                                        null,
                                        null,
                                      ),
                                      validator: FormBuilderValidators.compose(
                                        [
                                          FormBuilderValidators.required(
                                              context),
                                        ],
                                      ),
                                      format: DateFormat.jm(),
                                      initialTime: TimeOfDay.now(),
                                      inputType: InputType.time,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            convController.setOutTime(value);
                                            _totalField.currentState!.didChange(
                                              (convController.outTime.hour -
                                                          convController
                                                              .inTime.hour)
                                                      .toString() +
                                                  ' hours',
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                key: _totalField,
                                name: 'total_hours',
                                enabled: false,
                                decoration: inputStyle(
                                  'Total Time',
                                  null,
                                  null,
                                ),
                                initialValue: '0 hours',
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'from',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Travel From',
                                        null,
                                        null,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FormBuilderTextField(
                                      name: 'to',
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: inputStyle(
                                        'Travel To',
                                        null,
                                        null,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'payable_amount',
                                decoration: inputStyle(
                                  'Payable Amount',
                                  null,
                                  null,
                                ),
                                validator: FormBuilderValidators.compose(
                                  [
                                    FormBuilderValidators.required(context),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'details',
                                maxLines: 2,
                                decoration: inputStyle(
                                  'Details',
                                  null,
                                  null,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (_conveyanceFormKey.currentState!.validate()) {
                              // print(_leaveFormKey.currentState!.fields);
                              final convCreateData = <String, dynamic>{
                                'conveyance_type': _conveyanceFormKey
                                    .currentState!
                                    .fields['conveyance_type']!
                                    .value,
                                'line_manager_id': _conveyanceFormKey
                                    .currentState!
                                    .fields['line_manager_id']!
                                    .value,
                                'in_time': getDTString(
                                  _conveyanceFormKey.currentState!
                                      .fields['application_date']!.value,
                                  _conveyanceFormKey
                                      .currentState!.fields['in_time']!.value,
                                ),
                                'out_time': getDTString(
                                  _conveyanceFormKey.currentState!
                                      .fields['application_date']!.value,
                                  _conveyanceFormKey
                                      .currentState!.fields['out_time']!.value,
                                ),
                                'from': _conveyanceFormKey
                                    .currentState!.fields['from']!.value,
                                'to': _conveyanceFormKey
                                    .currentState!.fields['to']!.value,
                                'payable_amount': _conveyanceFormKey
                                    .currentState!
                                    .fields['payable_amount']!
                                    .value,
                                'details': _conveyanceFormKey
                                    .currentState!.fields['details']!.value,
                              };
                              await convController
                                  .createConveyance(convCreateData);
                            } else {
                              Get.dialog(
                                FadeInDown(
                                  duration: const Duration(milliseconds: 300),
                                  child: AlertDialog(
                                    title: const Text(
                                      'Error',
                                      style: TextStyle(
                                        color: ADNColorConstants.kADNWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: const Text(
                                      'Sorry your Reqeust could not be processed',
                                      style: TextStyle(
                                        color: ADNColorConstants.kADNWhite,
                                      ),
                                    ),
                                    backgroundColor: ADNColorConstants
                                        .kADNLightGreen
                                        .withOpacity(0.7),
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.create),
                          label: const Text("Submit"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => ADNColorConstants.kADNLightGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
