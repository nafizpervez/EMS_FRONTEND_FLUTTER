import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/sale_forcast.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/sales_forcast/sale_forcast_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesForcastCreate extends StatefulWidget {
  const SalesForcastCreate({Key? key}) : super(key: key);

  @override
  State<SalesForcastCreate> createState() => _SalesForcastCreateTable();
}

class _SalesForcastCreateTable extends State<SalesForcastCreate> {
  final GlobalKey<FormBuilderState> _saleForcastFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'SaleForcastCreateForm');

  final SaleForcastController sffController = Get.find<SaleForcastController>();

  final ScrollController _vCon = ScrollController(debugLabel: 'salesScroll');
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _saleForcastFormKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: SingleChildScrollView(
        controller: _vCon,
        child: ResponsiveUI(
          desktop: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'project_name',
                        decoration: inputStyle(
                          'Project Name',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'name_of_the_account',
                        decoration: inputStyle(
                          'Name of the Account',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'account_manager_name',
                        decoration: inputStyle(
                          'Account Manager Name',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person',
                        decoration: inputStyle(
                          'Contact Person',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person_mobile',
                        decoration: inputStyle(
                          'Contact Person Mobile',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person_email',
                        decoration: inputStyle(
                          'Contact Person Email',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'value_of_the_project',
                        decoration: inputStyle(
                          'Value of the Project',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderSlider(
                        name: 'probability_of_closing',
                        decoration: inputStyle(
                          'Probability of Closing',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        max: 100,
                        min: 0,
                        initialValue: 50,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDateTimePicker(
                        name: 'po_date',
                        inputType: InputType.date,
                        decoration: inputStyle(
                          'PO Date',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        format: DateFormat("dd-MM-yyyy"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDateTimePicker(
                        name: 'proposal_submission_date',
                        inputType: InputType.date,
                        decoration: inputStyle(
                          'Proposal Submission Date',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
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
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDateTimePicker(
                        name: 'last_follow_up_date',
                        inputType: InputType.date,
                        decoration: inputStyle(
                          'Last Follow-up Date',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        format: DateFormat("dd-MM-yyyy"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDateTimePicker(
                        name: 'expected_closing_date',
                        inputType: InputType.date,
                        decoration: inputStyle(
                          'Expected Closing Date',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        format: DateFormat("dd-MM-yyyy"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'activity_update',
                  maxLines: 4,
                  decoration: inputStyle(
                    'Activity Update',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'remark',
                  maxLines: 4,
                  decoration: inputStyle(
                    'Remark',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_saleForcastFormKey.currentState!.validate()) {
                            final SaleForcast _saleForcast = SaleForcast(
                              id: '0',
                              nameOfTheAccount: _saleForcastFormKey
                                  .currentState!
                                  .fields['name_of_the_account']!
                                  .value!,
                              accountManagerName: _saleForcastFormKey
                                  .currentState!
                                  .fields['account_manager_name']!
                                  .value,
                              projectName: _saleForcastFormKey
                                  .currentState!.fields['project_name']!.value,
                              contactPerson: _saleForcastFormKey.currentState!
                                  .fields['contact_person']!.value,
                              contactPersonMobile: _saleForcastFormKey
                                  .currentState!
                                  .fields['contact_person_mobile']!
                                  .value
                                  .toString(),
                              contactPersonEmail: _saleForcastFormKey
                                  .currentState!
                                  .fields['contact_person_email']!
                                  .value,
                              valueOfTheProject: _saleForcastFormKey
                                  .currentState!
                                  .fields['value_of_the_project']!
                                  .value,
                              probabilityOfClosing: _saleForcastFormKey
                                  .currentState!
                                  .fields['probability_of_closing']!
                                  .value
                                  .toString(),
                              poDate: _saleForcastFormKey
                                  .currentState!.fields['po_date']!.value
                                  .toString(),
                              proposalSubmissionDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['proposal_submission_date']!
                                  .value
                                  .toString(),
                              lastFollowUpDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['last_follow_up_date']!
                                  .value
                                  .toString(),
                              expectedClosingDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['expected_closing_date']!
                                  .value
                                  .toString(),
                              remarks: _saleForcastFormKey
                                  .currentState!.fields['remark']!.value,
                              activityUpdate: _saleForcastFormKey.currentState!
                                  .fields['activity_update']!.value,
                            );

                            sffController.createSaleForcast(_saleForcast);
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                          color: ADNColorConstants.kADNWhite,
                        ),
                        label: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Save Data',
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          phoneL: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'project_name',
                  decoration: inputStyle(
                    'Project Name',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'name_of_the_account',
                  decoration: inputStyle(
                    'Name of the Account',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'account_manager_name',
                  decoration: inputStyle(
                    'Account Manager Name',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'contact_person',
                  decoration: inputStyle(
                    'Contact Person',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'contact_person_mobile',
                  decoration: inputStyle(
                    'Contact Person Mobile',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'contact_person_email',
                  decoration: inputStyle(
                    'Contact Person Email',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'value_of_the_project',
                  decoration: inputStyle(
                    'Value of the Project',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderSlider(
                  name: 'probability_of_closing',
                  decoration: inputStyle(
                    'Probability of Closing',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  max: 100,
                  min: 0,
                  initialValue: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderDateTimePicker(
                  name: 'po_date',
                  inputType: InputType.date,
                  decoration: inputStyle(
                    'PO Date',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  format: DateFormat("dd-MM-yyyy"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderDateTimePicker(
                  name: 'proposal_submission_date',
                  inputType: InputType.date,
                  decoration: inputStyle(
                    'Proposal Submission Date',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  format: DateFormat("dd-MM-yyyy"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderDateTimePicker(
                  name: 'last_follow_up_date',
                  inputType: InputType.date,
                  decoration: inputStyle(
                    'Last Follow-up Date',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  format: DateFormat("dd-MM-yyyy"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderDateTimePicker(
                  name: 'expected_closing_date',
                  inputType: InputType.date,
                  decoration: inputStyle(
                    'Expected Closing Date',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  format: DateFormat("dd-MM-yyyy"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'activity_update',
                  maxLines: 4,
                  decoration: inputStyle(
                    'Activity Update',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderTextField(
                  name: 'remark',
                  maxLines: 4,
                  decoration: inputStyle(
                    'Remark',
                    null,
                    null,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_saleForcastFormKey.currentState!.validate()) {
                            final SaleForcast _saleForcast = SaleForcast(
                              id: '0',
                              nameOfTheAccount: _saleForcastFormKey
                                  .currentState!
                                  .fields['name_of_the_account']!
                                  .value!,
                              accountManagerName: _saleForcastFormKey
                                  .currentState!
                                  .fields['account_manager_name']!
                                  .value,
                              projectName: _saleForcastFormKey
                                  .currentState!.fields['project_name']!.value,
                              contactPerson: _saleForcastFormKey.currentState!
                                  .fields['contact_person']!.value,
                              contactPersonMobile: _saleForcastFormKey
                                  .currentState!
                                  .fields['contact_person_mobile']!
                                  .value
                                  .toString(),
                              contactPersonEmail: _saleForcastFormKey
                                  .currentState!
                                  .fields['contact_person_email']!
                                  .value,
                              valueOfTheProject: _saleForcastFormKey
                                  .currentState!
                                  .fields['value_of_the_project']!
                                  .value,
                              probabilityOfClosing: _saleForcastFormKey
                                  .currentState!
                                  .fields['probability_of_closing']!
                                  .value
                                  .toString(),
                              poDate: _saleForcastFormKey
                                  .currentState!.fields['po_date']!.value
                                  .toString(),
                              proposalSubmissionDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['proposal_submission_date']!
                                  .value
                                  .toString(),
                              lastFollowUpDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['last_follow_up_date']!
                                  .value
                                  .toString(),
                              expectedClosingDate: _saleForcastFormKey
                                  .currentState!
                                  .fields['expected_closing_date']!
                                  .value
                                  .toString(),
                              remarks: _saleForcastFormKey
                                  .currentState!.fields['remark']!.value,
                              activityUpdate: _saleForcastFormKey.currentState!
                                  .fields['activity_update']!.value,
                            );

                            sffController.createSaleForcast(_saleForcast);
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                          color: ADNColorConstants.kADNWhite,
                        ),
                        label: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Save Data',
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
