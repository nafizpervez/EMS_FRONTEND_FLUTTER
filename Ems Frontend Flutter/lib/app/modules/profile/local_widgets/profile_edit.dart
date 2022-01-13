import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:adnems/app/modules/profile/profile_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final GlobalKey<FormBuilderState> _profileEditFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'ProfileEditForm');

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
      child: GetX<ProfileController>(
        builder: (proController) {
          return SingleChildScrollView(
            controller: scC,
            child: FormBuilder(
              key: _profileEditFormKey,
              child: Column(
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
                        proController.setAttachment(picked.files.first);
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
                                      proController.user.avater,
                                      fit: BoxFit.cover,
                                      width: 200.0,
                                      height: 200.0,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return ProPicReplacementText(
                                          name: proController.user.name,
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
                                (states) => proController.attachment == null
                                    ? Colors.blue
                                    : ADNColorConstants.kADNLightGreen,
                              ),
                            ),
                            onPressed: () async {
                              var picked = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'jpg',
                                  'jpeg',
                                  'png',
                                ],
                              );

                              if (picked != null) {
                                proController.setAttachment(picked.files.first);
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
                            initialValue: proController.user.contactNumber,
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
                            initialValue: proController.user.email,
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
                            initialValue: proController.user.location,
                            enabled: true,
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
                                proController.user.bloodGroup == 'No Data'
                                    ? null
                                    : proController.user.bloodGroup,
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
                            initialValue: proController.user.employeeId,
                            enabled: false,
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
                            initialValue: proController.user.designation,
                            enabled: false,
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
                            initialValue: proController.user.department,
                            enabled: false,
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
                            initialValue: proController.user.division,
                            enabled: false,
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
                            initialValue: proController.user.grade,
                            enabled: false,
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
                            initialValue:
                                proController.user.dateOfJoining == 'No Data'
                                    ? null
                                    : DateTime.parse(
                                        proController.user.dateOfJoining,
                                      ),
                            enabled: false,
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
                            initialValue: proController.user.unit,
                            enabled: false,
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
                            initialValue: proController.user.subUnit,
                            enabled: false,
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
                        await proController.updateProfile(updatedData);
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
                              backgroundColor: ADNColorConstants.kADNLightGreen
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
          );
        },
      ),
    );
  }
}
