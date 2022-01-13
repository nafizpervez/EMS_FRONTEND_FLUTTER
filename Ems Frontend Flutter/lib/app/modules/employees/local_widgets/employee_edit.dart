import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:adnems/app/modules/employees/employee_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeEdit extends StatefulWidget {
  final User employee;
  const EmployeeEdit({Key? key, required this.employee}) : super(key: key);

  @override
  State<EmployeeEdit> createState() => _EmployeeEditState();
}

class _EmployeeEditState extends State<EmployeeEdit> {
  final GlobalKey<FormBuilderState> _profileEditFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'EmployeeEditForm');

  final ScrollController scC = ScrollController(debugLabel: 'profileEdit');

  late Image? placeholder;

  @override
  void initState() {
    super.initState();
    placeholder = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GetX<EmployeeController>(
        builder: (empCon) => empCon.employeeUpdating
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                controller: scC,
                child: FormBuilder(
                  key: _profileEditFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var picked = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: [
                              'jpg',
                              'jpeg',
                              'png',
                            ],
                          );

                          if (picked != null) {
                            empCon.setAttachment(picked.files.first);
                            setState(() {
                              placeholder = Image.memory(
                                picked.files.first.bytes!,
                                fit: BoxFit.cover,
                                width: 200.0,
                                height: 200.0,
                              );
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 100.0,
                                  child: ClipOval(
                                    child: placeholder ??
                                        Image.network(
                                          widget.employee.avater,
                                          fit: BoxFit.cover,
                                          width: 200.0,
                                          height: 200.0,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return ProPicReplacementText(
                                              name: widget.employee.name,
                                              dimension: 100.0,
                                            );
                                          },
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.cloud_upload),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Upload Image',
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => empCon.attachment == null
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
                                      'png',
                                    ],
                                  );

                                  if (picked != null) {
                                    empCon.setAttachment(picked.files.first);
                                    setState(() {
                                      placeholder = Image.memory(
                                        picked.files.first.bytes!,
                                        fit: BoxFit.cover,
                                        width: 200.0,
                                        height: 200.0,
                                      );
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormBuilderTextField(
                          name: 'name',
                          decoration: inputStyle(
                            'Name',
                            null,
                            null,
                          ),
                          initialValue: widget.employee.name,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'contact_number',
                                decoration: inputStyle(
                                  'Contact No',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.contactNumber,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'email',
                                decoration: inputStyle(
                                  'Email',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.email,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'location',
                                decoration: inputStyle(
                                  'Location',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.location,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderDropdown(
                                name: 'blood_group',
                                decoration: inputStyle(
                                  'Blood Group',
                                  null,
                                  null,
                                ),
                                allowClear: true,
                                focusColor: Colors.transparent,
                                initialValue:
                                    widget.employee.bloodGroup == 'No Data'
                                        ? null
                                        : widget.employee.bloodGroup,
                                items: [
                                  'O-',
                                  'O+',
                                  'A-',
                                  'A+',
                                  'B-',
                                  'B+',
                                  'AB-',
                                  'AB+',
                                ]
                                    .map(
                                      (value) => DropdownMenuItem(
                                        child: Text(value),
                                        value: value,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'employee_id',
                                decoration: inputStyle(
                                  'Employee ID',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.employeeId,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'designation',
                                decoration: inputStyle(
                                  'Designation',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.designation,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'department',
                                decoration: inputStyle(
                                  'Department',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.department,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'division',
                                decoration: inputStyle(
                                  'Division',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.division,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderDropdown(
                                name: 'grade',
                                decoration: inputStyle(
                                  'Grade',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.grade == 'No Data'
                                    ? null
                                    : widget.employee.grade,
                                focusColor: Colors.transparent,
                                items: List<DropdownMenuItem<String>>.generate(
                                  'P'.codeUnitAt(0) - 'A'.codeUnitAt(0) + 1,
                                  (index) => DropdownMenuItem(
                                    child: Text(
                                      String.fromCharCode(
                                          'A'.codeUnitAt(0) + index),
                                    ),
                                    value: String.fromCharCode(
                                        'A'.codeUnitAt(0) + index),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderDateTimePicker(
                                name: 'date_of_joining',
                                inputType: InputType.date,
                                decoration: inputStyle(
                                  'Joining Date',
                                  null,
                                  null,
                                ),
                                format: DateFormat("dd-MM-yyyy"),
                                initialValue:
                                    widget.employee.dateOfJoining == 'No Data'
                                        ? null
                                        : DateTime.parse(
                                            widget.employee.dateOfJoining,
                                          ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'unit',
                                decoration: inputStyle(
                                  'Unit',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.unit,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FormBuilderTextField(
                                name: 'sub_unit',
                                decoration: inputStyle(
                                  'Sub Unit',
                                  null,
                                  null,
                                ),
                                initialValue: widget.employee.subUnit,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_profileEditFormKey.currentState!.validate()) {
                            final updatedData = <String, dynamic>{
                              'name': _profileEditFormKey
                                  .currentState!.fields['name']!.value,
                              'contact_number': _profileEditFormKey
                                  .currentState!
                                  .fields['contact_number']!
                                  .value,
                              'email': _profileEditFormKey
                                  .currentState!.fields['email']!.value,
                              'location': _profileEditFormKey
                                  .currentState!.fields['location']!.value,
                              'blood_group': _profileEditFormKey
                                  .currentState!.fields['blood_group']!.value,
                              'employee_id': _profileEditFormKey
                                  .currentState!.fields['employee_id']!.value,
                              'designation': _profileEditFormKey
                                  .currentState!.fields['designation']!.value,
                              'grade': _profileEditFormKey
                                  .currentState!.fields['grade']!.value,
                              'division': _profileEditFormKey
                                  .currentState!.fields['division']!.value,
                              'department': _profileEditFormKey
                                  .currentState!.fields['department']!.value,
                              'unit': _profileEditFormKey
                                  .currentState!.fields['unit']!.value,
                              'sub_unit': _profileEditFormKey
                                  .currentState!.fields['sub_unit']!.value,
                              'date_of_joining': _profileEditFormKey
                                  .currentState!
                                  .fields['date_of_joining']!
                                  .value,
                            };

                            print(updatedData);
                            await empCon.updateEmployee(
                                updatedData, widget.employee);
                          } else {
                            Get.dialog(
                              FadeInDown(
                                duration: const Duration(milliseconds: 300),
                                child: AlertDialog(
                                  title: const Text(
                                    'Warning',
                                    style: TextStyle(
                                      color: ADNColorConstants.kADNWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: const Text(
                                    'Please Fill up the required fields',
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
                        label: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Update'),
                        ),
                        icon: const Icon(Icons.system_update_alt_rounded),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => ADNColorConstants.kADNLightGreen,
                          ),
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
