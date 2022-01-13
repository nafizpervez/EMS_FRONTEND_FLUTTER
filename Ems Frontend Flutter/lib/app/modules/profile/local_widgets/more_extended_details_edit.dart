import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoreExtendedDetailsEdit extends StatefulWidget {
  const MoreExtendedDetailsEdit({Key? key}) : super(key: key);

  @override
  _MoreExtendedDetailsEditState createState() =>
      _MoreExtendedDetailsEditState();
}

class _MoreExtendedDetailsEditState extends State<MoreExtendedDetailsEdit> {
  final GlobalKey<FormBuilderState> _extendedEditFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'MoreExtendedDetailsEdit');
  final ScrollController _scC =
      ScrollController(debugLabel: 'moreExtendedDetailsScroll');
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: GetX<ProfileController>(
        builder: (proCon) {
          return SingleChildScrollView(
            controller: _scC,
            child: FormBuilder(
              key: _extendedEditFormKey,
              child: Column(
                children: [
                  ResponsiveUI(
                    desktop: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'employment_term',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Employment term',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.employmentTerm,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'bank_account_for_salary',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Bank account for salary',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.bankAccountForSalary,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'bank_name',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Bank name',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon.extendedDetail.bankName,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'supervisor',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Supervisor',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.supervisor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'insurance_category',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Insurance category',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.insuranceCategory,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'fathers_name',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Fathers name',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.fathersName,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'mothers_name',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Mothers name',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.mothersName,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'spouse_name',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Spouse name',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.spouseName,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'nationality',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Nationality',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.nationality,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'religion',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Religion',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon.extendedDetail.religion,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'passport_number',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Passport number',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.passportNumber,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'mailing_address',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Mailing address',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.mailingAddress,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'personal_email',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Personal email',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.personalEmail,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'personal_contact_number',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Personal contact number',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.personalContactNumber,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'emergency_contact_number',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Emergency contact number',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.emergencyContactNumber,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'permanent_address',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Permanent address',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.permanentAddress,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'official_intercom_extension',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Official intercom extension',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.officialIntercomExtension,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'skype_id',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Skype id',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon.extendedDetail.skypeId,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'facebook_id',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Facebook id',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.facebookId,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'twitter_id',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Twitter id',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon.extendedDetail.twitterId,
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(5.0),
                              //   child: FormBuilderDateTimePicker(
                              //     name: 'date_of_birth',
                              //     inputType: InputType.date,
                              //     decoration: inputStyle(
                              //       'Date of birth',
                              //       null,
                              //       null,
                              //     ),
                              //     format: DateFormat("dd-MM-yyyy"),
                              //     initialValue: proCon
                              //                 .extendedDetail.dateOfBirth ==
                              //             'No Data'
                              //         ? null
                              //         : DateTime.parse(
                              //             proCon.extendedDetail.dateOfBirth),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderChoiceChip(
                                  name: 'marital_status',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Marital status',
                                    null,
                                    null,
                                  ),
                                  // initialValue: proCon.extendedDetail.maritalStatus,
                                  alignment: WrapAlignment.spaceEvenly,
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: 'married',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Married'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: 'unmarried',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Unmarried'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: 'divorced',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Divorced'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'linkedin_id',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Linkedin id',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.linkedinId,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'ssc_equivalent',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Ssc equivalent',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.sscEquivalent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'hsc_equivalent',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Hsc equivalent',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.hscEquivalent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'graduation',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Graduation',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.graduation,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'post_graduation',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Post graduation',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.postGraduation,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'ssc_from_school',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Ssc from school',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.sscFromSchool,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'hsc_from_college',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Hsc from college',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.hscFromCollege,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'grad_university',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Grad university',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.gradUniversity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'post_grad_university',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Post grad university',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.postGradUniversity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'professional_certification',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Professional certification',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.professionalCertification,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'social_afiliation',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Social afiliation',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.socialAfiliation,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'professional_afiliation',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Professional afiliation',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.professionalAfiliation,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'habits',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Habits',
                                    null,
                                    null,
                                  ),
                                  initialValue: proCon.extendedDetail.habits,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'award_achievements',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Award achievements',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.awardAchievements,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'total_job_experience',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Total job experience',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.totalJobExperience,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'tin',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Tin',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                    ],
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.tin.toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'pf_code',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Pf code',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                    ],
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.pfCode.toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'pf_contribution',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Pf contribution',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                    ],
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.pfContribution
                                      .toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'nid',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Nid',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                    ],
                                  ),
                                  initialValue:
                                      proCon.extendedDetail.nid.toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderTextField(
                                  name: 'number_of_child',
                                  textCapitalization: TextCapitalization.words,
                                  decoration: inputStyle(
                                    'Number of child',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.numeric(context),
                                    ],
                                  ),
                                  initialValue: proCon
                                      .extendedDetail.numberOfChild
                                      .toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderChoiceChip(
                                  name: 'gender',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Gender',
                                    null,
                                    null,
                                  ),
                                  // initialValue: proCon.extendedDetail.gender,
                                  alignment: WrapAlignment.spaceEvenly,
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: 'male',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Male'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: 'female',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Female'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: 'lgbtqa',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Lgbtqa'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderChoiceChip(
                                  name: 'is_two_factor_auth',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'Is two factor auth',
                                    null,
                                    null,
                                  ),
                                  // initialValue: proCon.extendedDetail.isTwoFactorAuth,
                                  alignment: WrapAlignment.spaceEvenly,
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: 'active',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Active'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: 'inactive',
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Inactive'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    phoneL: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'employment_term',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Employment term',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.employmentTerm,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'bank_account_for_salary',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Bank account for salary',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.bankAccountForSalary,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'bank_name',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Bank name',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.bankName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'supervisor',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Supervisor',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.supervisor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'insurance_category',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Insurance category',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.insuranceCategory,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'fathers_name',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Fathers name',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.fathersName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'mothers_name',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Mothers name',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.mothersName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'spouse_name',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Spouse name',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.spouseName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'nationality',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Nationality',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.nationality,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'religion',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Religion',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.religion,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'passport_number',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Passport number',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.passportNumber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'mailing_address',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Mailing address',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.mailingAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'personal_email',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Personal email',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.personalEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'personal_contact_number',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Personal contact number',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.personalContactNumber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'emergency_contact_number',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Emergency contact number',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.emergencyContactNumber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'permanent_address',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Permanent address',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.permanentAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'official_intercom_extension',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Official intercom extension',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.officialIntercomExtension,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'skype_id',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Skype id',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.skypeId,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'facebook_id',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Facebook id',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.facebookId,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'twitter_id',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Twitter id',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.twitterId,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderDateTimePicker(
                            name: 'date_of_birth',
                            inputType: InputType.date,
                            decoration: inputStyle(
                              'Date of birth',
                              null,
                              null,
                            ),
                            format: DateFormat("dd-MM-yyyy"),
                            initialValue:
                                proCon.extendedDetail.dateOfBirth == 'No Data'
                                    ? null
                                    : DateTime.parse(
                                        proCon.extendedDetail.dateOfBirth),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderChoiceChip(
                            name: 'marital_status',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: inputStyle(
                              'Marital status',
                              null,
                              null,
                            ),
                            // initialValue: proCon.extendedDetail.maritalStatus,
                            alignment: WrapAlignment.spaceEvenly,
                            options: const [
                              FormBuilderFieldOption(
                                value: 'married',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Married'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: 'unmarried',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Unmarried'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: 'divorced',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Divorced'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'linkedin_id',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Linkedin id',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.linkedinId,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'ssc_equivalent',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Ssc equivalent',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.sscEquivalent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'hsc_equivalent',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Hsc equivalent',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.hscEquivalent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'graduation',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Graduation',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.graduation,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'post_graduation',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Post graduation',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.postGraduation,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'ssc_from_school',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Ssc from school',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.sscFromSchool,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'hsc_from_college',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Hsc from college',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.hscFromCollege,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'grad_university',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Grad university',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.gradUniversity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'post_grad_university',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Post grad university',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.postGradUniversity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'professional_certification',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Professional certification',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.professionalCertification,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'social_afiliation',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Social afiliation',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.socialAfiliation,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'professional_afiliation',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Professional afiliation',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.professionalAfiliation,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'habits',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Habits',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.habits,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'award_achievements',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Award achievements',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.awardAchievements,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'total_job_experience',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Total job experience',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.totalJobExperience,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'tin',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Tin',
                              null,
                              null,
                            ),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.numeric(context),
                              ],
                            ),
                            initialValue: proCon.extendedDetail.tin.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'pf_code',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Pf code',
                              null,
                              null,
                            ),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.numeric(context),
                              ],
                            ),
                            initialValue:
                                proCon.extendedDetail.pfCode.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'pf_contribution',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Pf contribution',
                              null,
                              null,
                            ),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.numeric(context),
                              ],
                            ),
                            initialValue:
                                proCon.extendedDetail.pfContribution.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'nid',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Nid',
                              null,
                              null,
                            ),
                            initialValue: proCon.extendedDetail.nid.toString(),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.numeric(context),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'number_of_child',
                            textCapitalization: TextCapitalization.words,
                            decoration: inputStyle(
                              'Number of child',
                              null,
                              null,
                            ),
                            initialValue:
                                proCon.extendedDetail.numberOfChild.toString(),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.numeric(context),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderChoiceChip(
                            name: 'gender',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: inputStyle(
                              'Gender',
                              null,
                              null,
                            ),
                            // initialValue: proCon.extendedDetail.gender,
                            alignment: WrapAlignment.spaceEvenly,
                            options: const [
                              FormBuilderFieldOption(
                                value: 'male',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Male'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: 'female',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Female'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: 'lgbtqa',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Lgbtqa'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderChoiceChip(
                            name: 'is_two_factor_auth',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: inputStyle(
                              'Is two factor auth',
                              null,
                              null,
                            ),
                            // initialValue: proCon.extendedDetail.isTwoFactorAuth,
                            alignment: WrapAlignment.spaceEvenly,
                            options: const [
                              FormBuilderFieldOption(
                                value: 'active',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Active'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: 'inactive',
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Inactive'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_extendedEditFormKey.currentState!.validate()) {
                        final updatedData = <String, dynamic>{
                          'employment_term': _extendedEditFormKey
                              .currentState!.fields['employment_term']!.value!,
                          'bank_account_for_salary': _extendedEditFormKey
                              .currentState!
                              .fields['bank_account_for_salary']!
                              .value!,
                          'bank_name': _extendedEditFormKey
                              .currentState!.fields['bank_name']!.value!,
                          'supervisor': _extendedEditFormKey
                              .currentState!.fields['supervisor']!.value!,
                          'insurance_category': _extendedEditFormKey
                              .currentState!
                              .fields['insurance_category']!
                              .value!,
                          'fathers_name': _extendedEditFormKey
                              .currentState!.fields['fathers_name']!.value!,
                          'mothers_name': _extendedEditFormKey
                              .currentState!.fields['mothers_name']!.value!,
                          'spouse_name': _extendedEditFormKey
                              .currentState!.fields['spouse_name']!.value!,
                          'nationality': _extendedEditFormKey
                              .currentState!.fields['nationality']!.value!,
                          'religion': _extendedEditFormKey
                              .currentState!.fields['religion']!.value!,
                          'passport_number': _extendedEditFormKey
                              .currentState!.fields['passport_number']!.value!,
                          'mailing_address': _extendedEditFormKey
                              .currentState!.fields['mailing_address']!.value!,
                          'personal_email': _extendedEditFormKey
                              .currentState!.fields['personal_email']!.value!,
                          'personal_contact_number': _extendedEditFormKey
                              .currentState!
                              .fields['personal_contact_number']!
                              .value!,
                          'emergency_contact_number': _extendedEditFormKey
                              .currentState!
                              .fields['emergency_contact_number']!
                              .value!,
                          'permanent_address': _extendedEditFormKey
                              .currentState!
                              .fields['permanent_address']!
                              .value!,
                          'official_intercom_extension': _extendedEditFormKey
                              .currentState!
                              .fields['official_intercom_extension']!
                              .value!,
                          'skype_id': _extendedEditFormKey
                              .currentState!.fields['skype_id']!.value!,
                          'facebook_id': _extendedEditFormKey
                              .currentState!.fields['facebook_id']!.value!,
                          'twitter_id': _extendedEditFormKey
                              .currentState!.fields['twitter_id']!.value!,
                          'date_of_birth': _extendedEditFormKey
                              .currentState!.fields['date_of_birth']!.value!,
                          'marital_status': _extendedEditFormKey
                              .currentState!.fields['marital_status']!.value!,
                          'linkedin_id': _extendedEditFormKey
                              .currentState!.fields['linkedin_id']!.value!,
                          'ssc_equivalent': _extendedEditFormKey
                              .currentState!.fields['ssc_equivalent']!.value!,
                          'hsc_equivalent': _extendedEditFormKey
                              .currentState!.fields['hsc_equivalent']!.value!,
                          'graduation': _extendedEditFormKey
                              .currentState!.fields['graduation']!.value!,
                          'post_graduation': _extendedEditFormKey
                              .currentState!.fields['post_graduation']!.value!,
                          'ssc_from_school': _extendedEditFormKey
                              .currentState!.fields['ssc_from_school']!.value!,
                          'hsc_from_college': _extendedEditFormKey
                              .currentState!.fields['hsc_from_college']!.value!,
                          'grad_university': _extendedEditFormKey
                              .currentState!.fields['grad_university']!.value!,
                          'post_grad_university': _extendedEditFormKey
                              .currentState!
                              .fields['post_grad_university']!
                              .value!,
                          'professional_certification': _extendedEditFormKey
                              .currentState!
                              .fields['professional_certification']!
                              .value!,
                          'social_afiliation': _extendedEditFormKey
                              .currentState!
                              .fields['social_afiliation']!
                              .value!,
                          'professional_afiliation': _extendedEditFormKey
                              .currentState!
                              .fields['professional_afiliation']!
                              .value!,
                          'habits': _extendedEditFormKey
                              .currentState!.fields['habits']!.value!,
                          'award_achievements': _extendedEditFormKey
                              .currentState!
                              .fields['award_achievements']!
                              .value!,
                          'total_job_experience': _extendedEditFormKey
                              .currentState!
                              .fields['total_job_experience']!
                              .value!,
                          'tin': _extendedEditFormKey
                              .currentState!.fields['tin']!.value!,
                          'pf_code': _extendedEditFormKey
                              .currentState!.fields['pf_code']!.value!,
                          'pf_contribution': _extendedEditFormKey
                              .currentState!.fields['pf_contribution']!.value!,
                          'nid': _extendedEditFormKey
                              .currentState!.fields['nid']!.value!,
                          'number_of_child': _extendedEditFormKey
                              .currentState!.fields['number_of_child']!.value!,
                          'gender': _extendedEditFormKey
                              .currentState!.fields['gender']!.value!,
                          'is_two_factor_auth': _extendedEditFormKey
                              .currentState!
                              .fields['is_two_factor_auth']!
                              .value!,
                        };
                        // await proCon.updateExtendedProfile(updatedData);
                      } else {
                        print('not validated');
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
