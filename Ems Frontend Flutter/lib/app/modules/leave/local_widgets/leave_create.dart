import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/form_section_title.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/modules/leave/leave_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeaveCreate extends StatefulWidget {
  const LeaveCreate({Key? key}) : super(key: key);

  @override
  State<LeaveCreate> createState() => _LeaveCreateState();
}

class _LeaveCreateState extends State<LeaveCreate> {
  final AuthController authC = Get.find<AuthController>(
    tag: 'authfirst',
  );
  final GlobalKey<FormBuilderState> _leaveFormKey =
      GlobalKey<FormBuilderState>();

  final GlobalKey<FormFieldState> _totalField = GlobalKey<FormFieldState>();

  final ScrollController _scC = ScrollController();

  var upText = 'UPLOAD FILE';
  var upButtonIcon = Icons.cloud_upload;

  @override
  Widget build(BuildContext context) {
    return GetX<LeaveController>(
      builder: (leaveController) {
        return leaveController.leaveCreating
            ? const Center(
                child: CircularProgressIndicator(
                  color: ADNColorConstants.kADNLightGreen,
                ),
              )
            : FormBuilder(
                key: _leaveFormKey,
                child: SingleChildScrollView(
                  controller: _scC,
                  child: ResponsiveUI(
                    desktop: Column(
                      children: [
                        const FormSectionTitle(
                          title: 'Personal Information',
                        ),
                        SizedBox(
                          height: 350.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FormBuilderDateTimePicker(
                                        name: 'application_date',
                                        inputType: InputType.date,
                                        decoration: inputStyle(
                                          'Application Date',
                                          null,
                                          null,
                                        ),
                                        format: DateFormat("dd-MM-yyyy"),
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                          ],
                                        ),
                                        initialValue: DateTime.now(),
                                        enabled: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FormBuilderTextField(
                                        name: 'name',
                                        decoration: inputStyle(
                                          'Applicant Name',
                                          null,
                                          null,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                          ],
                                        ),
                                        initialValue: authC.user.name,
                                        enabled: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FormBuilderTextField(
                                        name: 'designation',
                                        decoration: inputStyle(
                                          'Applicant Designation',
                                          null,
                                          null,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                          ],
                                        ),
                                        initialValue: authC.user.designation,
                                        enabled: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FormBuilderTextField(
                                        name: 'department',
                                        decoration: inputStyle(
                                          'Applicant Department',
                                          null,
                                          null,
                                        ),
                                        validator:
                                            FormBuilderValidators.compose(
                                          [
                                            FormBuilderValidators.required(
                                                context),
                                          ],
                                        ),
                                        initialValue: authC.user.department,
                                        enabled: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                flex: 2,
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(upButtonIcon),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        upText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) => leaveController.attachment ==
                                              null
                                          ? Colors.blue
                                          : ADNColorConstants.kADNLightGreen,
                                    ),
                                  ),
                                  onPressed: () async {
                                    var picked =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                        'jpg',
                                        'jpeg',
                                        'pdf',
                                        'png',
                                      ],
                                    );

                                    if (picked != null) {
                                      leaveController
                                          .setAttachment(picked.files.first);
                                      setState(
                                        () {
                                          switch (picked.files.first.extension
                                              .toString()
                                              .toLowerCase()) {
                                            case 'jpg':
                                              upButtonIcon = Icons.image;
                                              upText = "An Image file named\n" +
                                                  picked.files.first.name
                                                      .toString() +
                                                  '\nhas been Uploaded';
                                              break;
                                            case 'jpeg':
                                              upButtonIcon = Icons.image;
                                              upText = "An Image file named\n" +
                                                  picked.files.first.name
                                                      .toString() +
                                                  '\nhas been Uploaded';
                                              break;
                                            case 'png':
                                              upButtonIcon = Icons.image;
                                              upText = "An Image file named\n" +
                                                  picked.files.first.name
                                                      .toString() +
                                                  '\nhas been Uploaded';
                                              break;
                                            case 'pdf':
                                              upButtonIcon =
                                                  Icons.picture_as_pdf;
                                              upText = "A pdf file named\n" +
                                                  picked.files.first.name
                                                      .toString() +
                                                  '\nhas been Uploaded';
                                              break;
                                            default:
                                              upText = "No File Selected";
                                              break;
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const FormSectionTitle(
                          title: 'Leave Information',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderDropdown(
                                  name: 'leave_type',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  allowClear: true,
                                  focusColor: Colors.transparent,
                                  decoration: inputStyle(
                                    'Leave Type',
                                    null,
                                    null,
                                  ),
                                  items: leaveController.leaveTypes
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
                                      FormBuilderValidators.required(context),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
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
                                  items: leaveController.lineManagers
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
                                      FormBuilderValidators.required(context),
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
                                  name: 'start_date',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Start Date',
                                    null,
                                    null,
                                  ),
                                  format: DateFormat("dd-MM-yyyy"),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(context),
                                    ],
                                  ),
                                  firstDate: DateTime.now().subtract(
                                    const Duration(
                                      days: 90,
                                    ),
                                  ),
                                  inputType: InputType.date,
                                  onChanged: (value) {
                                    setState(() {
                                      leaveController.setStartDate(value);
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderDateTimePicker(
                                  name: 'end_date',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'End Date',
                                    null,
                                    null,
                                  ),
                                  format: DateFormat("dd-MM-yyyy"),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(context),
                                    ],
                                  ),
                                  firstDate: leaveController.startDate,
                                  initialDate: leaveController.startDate,
                                  inputType: InputType.date,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        leaveController.setEndDate(value);
                                        _totalField.currentState!.didChange(
                                          (leaveController.endDate
                                                          .difference(
                                                              leaveController
                                                                  .startDate)
                                                          .inDays +
                                                      1)
                                                  .toString() +
                                              ' days',
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  key: _totalField,
                                  name: 'total_days',
                                  enabled: false,
                                  decoration: inputStyle(
                                    'Total Leave Days',
                                    null,
                                    null,
                                  ),
                                  initialValue: '0 days',
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(context),
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
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(context),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const FormSectionTitle(
                          title: 'Emergency Contact Information',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'emergency_contact_person',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Contact Person Name',
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
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'emergency_contact_number',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Contact Number',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                      FormBuilderValidators.required(context),
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
                            name: 'emergency_contact_address',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 2,
                            decoration: inputStyle(
                              'Contact Address',
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
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_leaveFormKey.currentState!.validate()) {
                                // print(_leaveFormKey.currentState!.fields);
                                final leaveCreateData = <String, dynamic>{
                                  'leave_type': _leaveFormKey.currentState!
                                      .fields['leave_type']!.value,
                                  'line_manager_id': _leaveFormKey.currentState!
                                      .fields['line_manager_id']!.value,
                                  'start_date': _leaveFormKey
                                      .currentState!.fields['start_date']!.value
                                      .toString()
                                      .replaceAll(' 00:00:00.000', ''),
                                  'end_date': _leaveFormKey
                                      .currentState!.fields['end_date']!.value
                                      .toString()
                                      .replaceAll(' 00:00:00.000', ''),
                                  'details': _leaveFormKey
                                      .currentState!.fields['details']!.value,
                                  'emergency_contact_person': _leaveFormKey
                                      .currentState!
                                      .fields['emergency_contact_person']!
                                      .value,
                                  'emergency_contact_number': _leaveFormKey
                                      .currentState!
                                      .fields['emergency_contact_number']!
                                      .value,
                                  'emergency_contact_address': _leaveFormKey
                                      .currentState!
                                      .fields['emergency_contact_address']!
                                      .value,
                                };
                                await leaveController
                                    .createLeave(leaveCreateData);
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
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
                                (states) => ADNColorConstants.kADNLightGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    phoneL: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const FormSectionTitle(
                            title: 'Personal Information',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderDateTimePicker(
                              name: 'application_date',
                              inputType: InputType.date,
                              decoration: inputStyle(
                                'Application Date',
                                null,
                                null,
                              ),
                              format: DateFormat("dd-MM-yyyy"),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                              initialValue: DateTime.now(),
                              enabled: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'name',
                              decoration: inputStyle(
                                'Applicant Name',
                                null,
                                null,
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                              initialValue: authC.user.name,
                              enabled: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'designation',
                              decoration: inputStyle(
                                'Applicant Designation',
                                null,
                                null,
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                              initialValue: authC.user.designation,
                              enabled: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'department',
                              decoration: inputStyle(
                                'Applicant Department',
                                null,
                                null,
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                              initialValue: authC.user.department,
                              enabled: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: ElevatedButton(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Icon(upButtonIcon),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    upText,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => leaveController.attachment == null
                                      ? Colors.blue
                                      : ADNColorConstants.kADNLightGreen,
                                ),
                              ),
                              onPressed: () async {
                                var picked =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'jpg',
                                    'jpeg',
                                    'pdf',
                                    'png',
                                  ],
                                );

                                if (picked != null) {
                                  leaveController
                                      .setAttachment(picked.files.first);
                                  setState(
                                    () {
                                      switch (picked.files.first.extension
                                          .toString()
                                          .toLowerCase()) {
                                        case 'jpg':
                                          upButtonIcon = Icons.image;
                                          upText = "An Image file named\n" +
                                              picked.files.first.name
                                                  .toString() +
                                              '\nhas been Uploaded';
                                          break;
                                        case 'jpeg':
                                          upButtonIcon = Icons.image;
                                          upText = "An Image file named\n" +
                                              picked.files.first.name
                                                  .toString() +
                                              '\nhas been Uploaded';
                                          break;
                                        case 'png':
                                          upButtonIcon = Icons.image;
                                          upText = "An Image file named\n" +
                                              picked.files.first.name
                                                  .toString() +
                                              '\nhas been Uploaded';
                                          break;
                                        case 'pdf':
                                          upButtonIcon = Icons.picture_as_pdf;
                                          upText = "A pdf file named\n" +
                                              picked.files.first.name
                                                  .toString() +
                                              '\nhas been Uploaded';
                                          break;
                                        default:
                                          upText = "No File Selected";
                                          break;
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const FormSectionTitle(
                            title: 'Leave Information',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderDropdown(
                              name: 'leave_type',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              allowClear: true,
                              focusColor: Colors.transparent,
                              decoration: inputStyle(
                                'Leave Type',
                                null,
                                null,
                              ),
                              items: leaveController.leaveTypes
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
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
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
                              items: leaveController.lineManagers
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
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.5),
                                  child: FormBuilderDateTimePicker(
                                    name: 'start_date',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: inputStyle(
                                      'Start Date',
                                      null,
                                      null,
                                    ),
                                    format: DateFormat("dd-MM-yyyy"),
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(context),
                                      ],
                                    ),
                                    firstDate: DateTime.now(),
                                    inputType: InputType.date,
                                    onChanged: (value) {
                                      setState(() {
                                        leaveController.setStartDate(value);
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.5),
                                  child: FormBuilderDateTimePicker(
                                    name: 'end_date',
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: inputStyle(
                                      'End Date',
                                      null,
                                      null,
                                    ),
                                    format: DateFormat("dd-MM-yyyy"),
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(context),
                                      ],
                                    ),
                                    firstDate: leaveController.startDate,
                                    initialDate: leaveController.startDate,
                                    inputType: InputType.date,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          leaveController.setEndDate(value);
                                          _totalField.currentState!.didChange(
                                            (leaveController.endDate
                                                            .difference(
                                                                leaveController
                                                                    .startDate)
                                                            .inDays +
                                                        1)
                                                    .toString() +
                                                ' days',
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              key: _totalField,
                              name: 'total_days',
                              enabled: false,
                              decoration: inputStyle(
                                'Total Leave Days',
                                null,
                                null,
                              ),
                              initialValue: '0 days',
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'details',
                              maxLines: 2,
                              decoration: inputStyle(
                                'Details',
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
                            height: 15.0,
                          ),
                          const FormSectionTitle(
                            title: 'Emergency Contact Information',
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'emergency_contact_person',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: inputStyle(
                                'Contact Person Name',
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
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'emergency_contact_number',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: inputStyle(
                                'Contact Number',
                                null,
                                null,
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.numeric(context),
                                  FormBuilderValidators.required(context),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: FormBuilderTextField(
                              name: 'emergency_contact_address',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 2,
                              decoration: inputStyle(
                                'Contact Address',
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
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.5),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                if (_leaveFormKey.currentState!.validate()) {
                                  // print(_leaveFormKey.currentState!.fields);
                                  final leaveCreateData = <String, dynamic>{
                                    'leave_type': _leaveFormKey.currentState!
                                        .fields['leave_type']!.value,
                                    'line_manager_id': _leaveFormKey
                                        .currentState!
                                        .fields['line_manager_id']!
                                        .value,
                                    'start_date': _leaveFormKey.currentState!
                                        .fields['start_date']!.value
                                        .toString()
                                        .replaceAll(' 00:00:00.000', ''),
                                    'end_date': _leaveFormKey
                                        .currentState!.fields['end_date']!.value
                                        .toString()
                                        .replaceAll(' 00:00:00.000', ''),
                                    'details': _leaveFormKey
                                        .currentState!.fields['details']!.value,
                                    'emergency_contact_person': _leaveFormKey
                                        .currentState!
                                        .fields['emergency_contact_person']!
                                        .value,
                                    'emergency_contact_number': _leaveFormKey
                                        .currentState!
                                        .fields['emergency_contact_number']!
                                        .value,
                                    'emergency_contact_address': _leaveFormKey
                                        .currentState!
                                        .fields['emergency_contact_address']!
                                        .value,
                                  };
                                  await leaveController
                                      .createLeave(leaveCreateData);
                                } else {
                                  Get.dialog(
                                    FadeInDown(
                                      duration:
                                          const Duration(milliseconds: 300),
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
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => ADNColorConstants.kADNLightGreen,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
