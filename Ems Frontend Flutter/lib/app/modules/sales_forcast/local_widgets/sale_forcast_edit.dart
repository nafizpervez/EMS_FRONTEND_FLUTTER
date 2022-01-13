import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/sale_forcast.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/sales_forcast/sale_forcast_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalesForcastEdit extends StatefulWidget {
  final SaleForcast saleF;
  const SalesForcastEdit({Key? key, required this.saleF}) : super(key: key);

  @override
  State<SalesForcastEdit> createState() => _SalesForcastEditState();
}

class _SalesForcastEditState extends State<SalesForcastEdit> {
  final GlobalKey<FormBuilderState> _saleForcastFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'SaleForcastEditForm');

  final SaleForcastController sffController = Get.find<SaleForcastController>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _saleForcastFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: ListView(
          children: [
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'project_name',
                        initialValue: widget.saleF.projectName,
                        decoration: inputStyle(
                          'Project Name',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'name_of_the_account',
                        initialValue: widget.saleF.nameOfTheAccount,
                        decoration: inputStyle(
                          'Name of the Account',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'account_manager_name',
                        initialValue: widget.saleF.accountManagerName,
                        decoration: inputStyle(
                          'Account Manager Name',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person',
                        initialValue: widget.saleF.contactPerson,
                        decoration: inputStyle(
                          'Contact Person',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person_mobile',
                        initialValue: widget.saleF.contactPersonMobile,
                        decoration: inputStyle(
                          'Contact Person Mobile',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'contact_person_email',
                        initialValue: widget.saleF.contactPersonEmail,
                        decoration: inputStyle(
                          'Contact Person Email',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderTextField(
                        name: 'value_of_the_project',
                        initialValue: widget.saleF.valueOfTheProject,
                        decoration: inputStyle(
                          'Value of the Project',
                          null,
                          null,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                        ]),
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
                        initialValue: double.parse(
                          widget.saleF.probabilityOfClosing == 'No Data'
                              ? '0'
                              : widget.saleF.probabilityOfClosing,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
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
                        initialValue: widget.saleF.poDate == 'No Data'
                            ? null
                            : DateTime.parse(
                                widget.saleF.poDate,
                              ),
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
                        initialValue:
                            widget.saleF.proposalSubmissionDate == 'No Data'
                                ? null
                                : DateTime.parse(
                                    widget.saleF.proposalSubmissionDate,
                                  ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
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
                        initialValue: widget.saleF.lastFollowUpDate == 'No Data'
                            ? null
                            : DateTime.parse(
                                widget.saleF.lastFollowUpDate,
                              ),
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
                        initialValue:
                            widget.saleF.expectedClosingDate == 'No Data'
                                ? null
                                : DateTime.parse(
                                    widget.saleF.expectedClosingDate,
                                  ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FormBuilderTextField(
                name: 'activity_update',
                maxLines: 4,
                initialValue: widget.saleF.activityUpdate,
                decoration: inputStyle(
                  'Activity Update',
                  null,
                  null,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FormBuilderTextField(
                name: 'remark',
                maxLines: 4,
                initialValue: widget.saleF.remarks,
                decoration: inputStyle(
                  'Remark',
                  null,
                  null,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
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
                            id: widget.saleF.id,
                            nameOfTheAccount: _saleForcastFormKey.currentState!
                                .fields['name_of_the_account']!.value!,
                            accountManagerName: _saleForcastFormKey
                                .currentState!
                                .fields['account_manager_name']!
                                .value,
                            projectName: _saleForcastFormKey
                                .currentState!.fields['project_name']!.value,
                            contactPerson: _saleForcastFormKey
                                .currentState!.fields['contact_person']!.value,
                            contactPersonMobile: _saleForcastFormKey
                                .currentState!
                                .fields['contact_person_mobile']!
                                .value
                                .toString(),
                            contactPersonEmail: _saleForcastFormKey
                                .currentState!
                                .fields['contact_person_email']!
                                .value,
                            valueOfTheProject: _saleForcastFormKey.currentState!
                                .fields['value_of_the_project']!.value
                                .toString()
                                .replaceAll(',', ''),
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
                            lastFollowUpDate: _saleForcastFormKey.currentState!
                                .fields['last_follow_up_date']!.value
                                .toString(),
                            expectedClosingDate: _saleForcastFormKey
                                .currentState!
                                .fields['expected_closing_date']!
                                .value
                                .toString(),
                            remarks: _saleForcastFormKey
                                .currentState!.fields['remark']!.value,
                            activityUpdate: _saleForcastFormKey
                                .currentState!.fields['activity_update']!.value,
                          );

                          sffController.editSaleForcast(_saleForcast);
                        }
                      },
                      icon: const Icon(
                        Icons.update,
                        color: ADNColorConstants.kADNWhite,
                      ),
                      label: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Update',
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
    );
  }
}
