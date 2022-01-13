import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeCreate extends StatefulWidget {
  const EmployeeCreate({
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeCreate> createState() => _EmployeeCreateState();
}

class _EmployeeCreateState extends State<EmployeeCreate> {
  final GlobalKey<FormBuilderState> _profileEditFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'EmployeeCreateForm');

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
      child: SingleChildScrollView(
        controller: scC,
        child: FormBuilder(
          key: _profileEditFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
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
                        enabled: true,
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
                        enabled: true,
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
                        enabled: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FormBuilderTextField(
                        name: 'blood_group',
                        decoration: inputStyle(
                          'Blood Group',
                          null,
                          null,
                        ),
                        enabled: true,
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
                        name: 'grade',
                        decoration: inputStyle(
                          'Grade',
                          null,
                          null,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FormBuilderDateTimePicker(
                        name: 'date',
                        inputType: InputType.date,
                        decoration: inputStyle(
                          'Joining Date',
                          null,
                          null,
                        ),
                        format: DateFormat("dd-MM-yyyy"),
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
                      'location': _profileEditFormKey
                          .currentState!.fields['location']!.value!,
                      'blood_group': _profileEditFormKey
                          .currentState!.fields['blood_group']!.value!,
                      'contact_number': _profileEditFormKey
                          .currentState!.fields['contact_number']!.value!,
                      'email': _profileEditFormKey
                          .currentState!.fields['email']!.value!,
                    };
                    // await proController.updateEmployee(updatedData);
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
                          backgroundColor:
                              ADNColorConstants.kADNLightGreen.withOpacity(0.7),
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
    );
  }
}
