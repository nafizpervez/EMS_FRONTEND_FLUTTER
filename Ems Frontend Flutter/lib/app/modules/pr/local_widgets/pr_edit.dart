import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/pr_item.dart';
import 'package:adnems/app/data/models/purchase_requisition.dart';
import 'package:adnems/app/global/widgets/form_section_title.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/modules/pr/pr_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PREdit extends StatefulWidget {
  final PurchaseRequisition pr;
  const PREdit({
    Key? key,
    required this.pr,
  }) : super(key: key);

  @override
  State<PREdit> createState() => _PREditState();
}

class _PREditState extends State<PREdit> {
  final AuthController authC = Get.find<AuthController>(
    tag: 'authfirst',
  );
  final GlobalKey<FormBuilderState> _prFormKey = GlobalKey<FormBuilderState>();

  final ScrollController _scC = ScrollController(debugLabel: 'prFormScroll');

  var upText = 'UPLOAD FILE';
  var upButtonIcon = Icons.cloud_upload;
  var itemCount = 0;
  @override
  void initState() {
    super.initState();
    itemCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GetX<PRController>(
      builder: (prController) {
        prController.setPrItems(widget.pr.prItems);
        return prController.prCreating
            ? const Center(
                child: CircularProgressIndicator(
                  color: ADNColorConstants.kADNLightGreen,
                ),
              )
            : FormBuilder(
                key: _prFormKey,
                child: ListView(
                  controller: _scC,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const FormSectionTitle(
                      title: 'PR Information',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FormBuilderTextField(
                              name: 'pr_id',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              enabled: false,
                              initialValue: widget.pr.serialId,
                              decoration: inputStyle(
                                'PR ID',
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
                            child: FormBuilderDropdown(
                              name: 'expanse_type',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              focusColor: Colors.transparent,
                              initialValue: widget.pr.expanseType,
                              decoration: inputStyle(
                                'Expanse Type',
                                null,
                                null,
                              ),
                              items: prController.expenseTypes
                                  .map(
                                    (expt) => DropdownMenuItem(
                                        child: Text(
                                          expt.toUpperCase(),
                                        ),
                                        value: expt),
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
                          width: 10.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FormBuilderDropdown(
                              name: 'line_manager_id',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              initialValue: widget
                                  .pr.approvals[1].needApprovalFrom.employeeId,
                              focusColor: Colors.transparent,
                              decoration: inputStyle(
                                'Line Manager',
                                null,
                                null,
                              ),
                              items: prController.lineManagers
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
                            child: FormBuilderTextField(
                              name: 'purpose_of_purchase',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              initialValue: widget.pr.purposeOfPurchase,
                              decoration: inputStyle(
                                'Purpose of Purchase',
                                null,
                                null,
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
                              name: 'user',
                              textCapitalization: TextCapitalization.words,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              initialValue: widget.pr.user,
                              decoration: inputStyle(
                                'User',
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
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FormBuilderTextField(
                        name: 'comment',
                        maxLines: 2,
                        initialValue: widget.pr.comment,
                        decoration: inputStyle(
                          'Comment',
                          null,
                          null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const FormSectionTitle(
                      title: 'Item List',
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          prController.prItems.length,
                          (index) {
                            final _item = prController.prItems[index];
                            return Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name: 'prev_sl_${index + 1}',
                                                initialValue: '${index + 1}',
                                                enabled: false,
                                                decoration: inputStyle(
                                                  'SL',
                                                  null,
                                                  null,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderDropdown(
                                                name:
                                                    'prev_purchase_type_${index + 1}',
                                                allowClear: true,
                                                focusColor: Colors.transparent,
                                                initialValue:
                                                    _item.purchaseType,
                                                decoration: inputStyle(
                                                  'Purchase Type',
                                                  null,
                                                  null,
                                                ),
                                                items: prController
                                                    .purchaseTypes
                                                    .map(
                                                      (e) => DropdownMenuItem(
                                                        child: Text(e
                                                            .replaceAll(
                                                                '_', ' ')
                                                            .capitalize!),
                                                        value: (e),
                                                      ),
                                                    )
                                                    .toList(),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'prev_item_description_${index + 1}',
                                                decoration: inputStyle(
                                                  'Item Description',
                                                  null,
                                                  null,
                                                ),
                                                initialValue:
                                                    _item.itemDescription,
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'prev_item_quantity_${index + 1}',
                                                decoration: inputStyle(
                                                  'Item Quantity',
                                                  null,
                                                  null,
                                                ),
                                                initialValue: _item.itemQuantity
                                                    .toString(),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'prev_measurement_of_unit_${index + 1}',
                                                initialValue:
                                                    _item.measurementOfUnit,
                                                decoration: inputStyle(
                                                  'Measurement of Unit',
                                                  null,
                                                  null,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderDateTimePicker(
                                                name:
                                                    'prev_required_date_${index + 1}',
                                                inputType: InputType.date,
                                                initialValue:
                                                    _item.requiredDate ==
                                                            'No Data'
                                                        ? null
                                                        : DateTime.parse(
                                                            _item.requiredDate),
                                                decoration: inputStyle(
                                                  'Required Date',
                                                  null,
                                                  null,
                                                ),
                                                format:
                                                    DateFormat("dd-MM-yyyy"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'prev_estimated_unit_price_${index + 1}',
                                                decoration: inputStyle(
                                                  'Estimated Unit Price',
                                                  null,
                                                  null,
                                                ),
                                                initialValue: _item
                                                    .estimatedUnitPrice
                                                    .toString(),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'prev_estimated_total_price_${index + 1}',
                                                decoration: inputStyle(
                                                  'Estimated Total Price',
                                                  null,
                                                  null,
                                                ),
                                                initialValue: _item
                                                    .estimatedTotalPrice
                                                    .toString(),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        ...List.generate(
                          itemCount,
                          (index) {
                            return Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Table(
                                  children: [
                                    TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name: 'sl_${index + 1}',
                                                initialValue:
                                                    '${index + 1 + prController.prItems.length}',
                                                enabled: false,
                                                decoration: inputStyle(
                                                  'SL',
                                                  null,
                                                  null,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderDropdown(
                                                name:
                                                    'purchase_type_${index + 1}',
                                                allowClear: true,
                                                focusColor: Colors.transparent,
                                                decoration: inputStyle(
                                                  'Purchase Type',
                                                  null,
                                                  null,
                                                ),
                                                items: prController
                                                    .purchaseTypes
                                                    .map(
                                                      (e) => DropdownMenuItem(
                                                        child: Text(e
                                                            .replaceAll(
                                                                '_', ' ')
                                                            .capitalize!),
                                                        value: (e),
                                                      ),
                                                    )
                                                    .toList(),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'item_description_${index + 1}',
                                                decoration: inputStyle(
                                                  'Item Description',
                                                  null,
                                                  null,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'item_quantity_${index + 1}',
                                                decoration: inputStyle(
                                                  'Item Quantity',
                                                  null,
                                                  null,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'measurement_of_unit_${index + 1}',
                                                decoration: inputStyle(
                                                  'Measurement of Unit',
                                                  null,
                                                  null,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderDateTimePicker(
                                                name:
                                                    'required_date_${index + 1}',
                                                inputType: InputType.date,
                                                decoration: inputStyle(
                                                  'Required Date',
                                                  null,
                                                  null,
                                                ),
                                                format:
                                                    DateFormat("dd-MM-yyyy"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'estimated_unit_price_${index + 1}',
                                                decoration: inputStyle(
                                                  'Estimated Unit Price',
                                                  null,
                                                  null,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: FormBuilderTextField(
                                                name:
                                                    'estimated_total_price_${index + 1}',
                                                decoration: inputStyle(
                                                  'Estimated Total Price',
                                                  null,
                                                  null,
                                                ),
                                                validator: FormBuilderValidators
                                                    .compose(
                                                  [
                                                    FormBuilderValidators
                                                        .integer(context),
                                                    FormBuilderValidators
                                                        .required(context),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  itemCount++;
                                });
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Add More Items'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => ADNColorConstants.kADNLightGreen,
                                ),
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
                            child: ElevatedButton.icon(
                              onPressed: () {
                                if (itemCount > 0) {
                                  setState(() {
                                    itemCount--;
                                  });
                                } else {
                                  prController.prItems.removeLast();
                                }
                              },
                              icon: const Icon(Icons.remove),
                              label: const Text('Remove Last Item'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Colors.red,
                                ),
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
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (_prFormKey.currentState!.validate()) {
                            final List<PrItem> _prevPRItems = List.generate(
                              prController.prItems.length,
                              (index) => PrItem(
                                id: index.toString(),
                                purchaseType: _prFormKey
                                    .currentState!
                                    .fields['prev_purchase_type_${index + 1}']!
                                    .value,
                                itemDescription: _prFormKey
                                    .currentState!
                                    .fields[
                                        'prev_item_description_${index + 1}']!
                                    .value,
                                itemQuantity: int.parse(_prFormKey
                                    .currentState!
                                    .fields['prev_item_quantity_${index + 1}']!
                                    .value),
                                measurementOfUnit: _prFormKey
                                        .currentState!
                                        .fields[
                                            'prev_measurement_of_unit_${index + 1}']!
                                        .value ??
                                    'No Data',
                                requiredDate: _prFormKey
                                            .currentState!
                                            .fields[
                                                'prev_required_date_${index + 1}']!
                                            .value ==
                                        null
                                    ? 'No Data'
                                    : _prFormKey
                                        .currentState!
                                        .fields[
                                            'prev_required_date_${index + 1}']!
                                        .value
                                        .toString()
                                        .replaceAll(' 00:00:00.000', ''),
                                estimatedUnitPrice: int.parse(_prFormKey
                                    .currentState!
                                    .fields[
                                        'prev_estimated_unit_price_${index + 1}']!
                                    .value),
                                estimatedTotalPrice: int.parse(_prFormKey
                                    .currentState!
                                    .fields[
                                        'prev_estimated_total_price_${index + 1}']!
                                    .value),
                              ),
                            );

                            final List<PrItem> _newPRItems = List.generate(
                              itemCount,
                              (index) => PrItem(
                                id: index.toString(),
                                purchaseType: _prFormKey
                                    .currentState!
                                    .fields['purchase_type_${index + 1}']!
                                    .value,
                                itemDescription: _prFormKey
                                    .currentState!
                                    .fields['item_description_${index + 1}']!
                                    .value,
                                itemQuantity: int.parse(_prFormKey
                                    .currentState!
                                    .fields['item_quantity_${index + 1}']!
                                    .value),
                                measurementOfUnit: _prFormKey
                                        .currentState!
                                        .fields[
                                            'measurement_of_unit_${index + 1}']!
                                        .value ??
                                    'No Data',
                                requiredDate: _prFormKey
                                            .currentState!
                                            .fields[
                                                'required_date_${index + 1}']!
                                            .value ==
                                        null
                                    ? 'No Data'
                                    : _prFormKey
                                        .currentState!
                                        .fields['required_date_${index + 1}']!
                                        .value
                                        .toString()
                                        .replaceAll(' 00:00:00.000', ''),
                                estimatedUnitPrice: int.parse(_prFormKey
                                    .currentState!
                                    .fields[
                                        'estimated_unit_price_${index + 1}']!
                                    .value),
                                estimatedTotalPrice: int.parse(_prFormKey
                                    .currentState!
                                    .fields[
                                        'estimated_total_price_${index + 1}']!
                                    .value),
                              ),
                            );

                            final List<PrItem> _finalPrItems =
                                _prevPRItems + _newPRItems;

                            final prUpdateData = <String, dynamic>{
                              'expanse_type': _prFormKey
                                  .currentState!.fields['expanse_type']!.value,
                              'line_manager_id': _prFormKey.currentState!
                                  .fields['line_manager_id']!.value
                                  .toString(),
                              'purpose_of_purchase': _prFormKey.currentState!
                                  .fields['purpose_of_purchase']!.value,
                              'user': _prFormKey
                                  .currentState!.fields['user']!.value,
                              'comment': _prFormKey
                                  .currentState!.fields['comment']!.value,
                            };

                            if (_finalPrItems.isNotEmpty) {
                              prUpdateData.addAll(
                                {
                                  'items': List<dynamic>.from(
                                    _finalPrItems.map(
                                      (x) => x.toJson(),
                                    ),
                                  ),
                                },
                              );
                            }
                            await prController.updatePR(
                                prUpdateData, widget.pr.id);
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
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
