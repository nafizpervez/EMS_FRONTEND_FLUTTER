import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/inventory/inventory_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class InventoryCreate extends StatefulWidget {
  const InventoryCreate({Key? key}) : super(key: key);

  @override
  State<InventoryCreate> createState() => _InventoryCreateTable();
}

class _InventoryCreateTable extends State<InventoryCreate> {
  final GlobalKey<FormBuilderState> _inventoryCreateFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'SaleForcastCreateForm');

  final GlobalKey<FormFieldState> _physicallyFoundValueField =
      GlobalKey<FormFieldState>(debugLabel: 'physicallyFoundValueField');
  final GlobalKey<FormFieldState> _salesValueField =
      GlobalKey<FormFieldState>(debugLabel: 'salesValueField');
  final GlobalKey<FormFieldState> _purchaseValueField =
      GlobalKey<FormFieldState>(debugLabel: 'purchaseValueField');
  final GlobalKey<FormFieldState> _stockValueToBeReportedField =
      GlobalKey<FormFieldState>(debugLabel: 'stockValueToBeReportedField');
  final GlobalKey<FormFieldState> _excessValueField =
      GlobalKey<FormFieldState>(debugLabel: 'excessValueField');
  final GlobalKey<FormFieldState> _shortageValueField =
      GlobalKey<FormFieldState>(debugLabel: 'shortageValueField');

  var upText = 'Clink to Add Product Image';
  var upButtonIcon = Icons.cloud_upload;

  final ScrollController _vCon = ScrollController(debugLabel: 'invScroll');
  @override
  Widget build(BuildContext context) {
    return GetX<InventoryController>(
      builder: (invController) {
        return invController.stockCreating
            ? const Center(
                child: CircularProgressIndicator(
                  color: ADNColorConstants.kADNLightGreen,
                ),
              )
            : FormBuilder(
                key: _inventoryCreateFormKey,
                child: SingleChildScrollView(
                  controller: _vCon,
                  child: ResponsiveUI(
                    desktop: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            'Product Information',
                            style: TextStyle(fontSize: 18.0),
                          )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  name: 'product_name',
                                  decoration: inputStyle(
                                    'Product Name',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  name: 'client_name',
                                  decoration: inputStyle(
                                    'Client Name',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'product_category',
                                  decoration: inputStyle(
                                    'Product Category',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  name: 'per_unit_price',
                                  decoration: inputStyle(
                                    'Per Unit Price',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  initialValue: 0.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPerUnitPrice(
                                        int.parse(value!),
                                      );

                                      _physicallyFoundValueField.currentState!
                                          .didChange(
                                        invController.physicallyFoundValue,
                                      );
                                      _salesValueField.currentState!.didChange(
                                        invController.salesValue,
                                      );
                                      _purchaseValueField.currentState!.didChange(
                                        invController.purchaseValue,
                                      );
                                      _stockValueToBeReportedField.currentState!
                                          .didChange(
                                        invController.stockValueToBeReported,
                                      );
                                      _excessValueField.currentState!.didChange(
                                        invController.excessValue,
                                      );
                                      _shortageValueField.currentState!.didChange(
                                        invController.shortageValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                      (states) => invController.attachment == null
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
                                      ],
                                    );

                                    if (picked != null) {
                                      invController
                                          .setAttachment(picked.files.first);
                                      setState(
                                        () {
                                          upButtonIcon = Icons.image;
                                          upText = "An Image file named\n" +
                                              picked.files.first.name.toString() +
                                              '\nhas been Uploaded';
                                        },
                                      );
                                    }
                                  },
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
                                  name: 'product_particulars',
                                  decoration: inputStyle(
                                    'Product Particulars',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  name: 'latest_stock',
                                  decoration: inputStyle(
                                    'Latest Stock',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            'Product Stock Information',
                            style: TextStyle(fontSize: 18.0),
                          )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  name: 'physically_found_quantity',
                                  decoration: inputStyle(
                                    'Physically Found Quantity',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  initialValue: 0.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPhysicallyFoundValue(
                                        int.parse(value!),
                                      );

                                      _physicallyFoundValueField.currentState!
                                          .didChange(
                                        invController.physicallyFoundValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _physicallyFoundValueField,
                                  enabled: false,
                                  name: 'physically_found_Value',
                                  decoration: inputStyle(
                                    'Physically Found Value',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      invController.physicallyFoundValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'sales_quantity',
                                  decoration: inputStyle(
                                    'Sales Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setSalesValue(
                                        int.parse(value!),
                                      );

                                      _salesValueField.currentState!.didChange(
                                        invController.salesValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _salesValueField,
                                  enabled: false,
                                  name: 'sales_value',
                                  decoration: inputStyle(
                                    'Sales Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.salesValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'purchase_quantity',
                                  decoration: inputStyle(
                                    'Purchase Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPurchaseValue(
                                        int.parse(value!),
                                      );

                                      _purchaseValueField.currentState!.didChange(
                                        invController.purchaseValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _purchaseValueField,
                                  enabled: false,
                                  name: 'purchase_value',
                                  decoration: inputStyle(
                                    'Purchase Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.purchaseValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'stock_quantity_to_be_reported',
                                  decoration: inputStyle(
                                    'Stock Quantity to be Reported',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setStockValueToBeReported(
                                        int.parse(value!),
                                      );

                                      _stockValueToBeReportedField.currentState!
                                          .didChange(
                                        invController.stockValueToBeReported,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _stockValueToBeReportedField,
                                  enabled: false,
                                  name: 'stock_value_to_be_reported',
                                  decoration: inputStyle(
                                    'Stock Value to be Reported',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      invController.stockValueToBeReported,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'excess_quantity',
                                  decoration: inputStyle(
                                    'Excess Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setExcessValue(
                                        int.parse(value!),
                                      );

                                      _excessValueField.currentState!.didChange(
                                        invController.excessValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _excessValueField,
                                  enabled: false,
                                  name: 'excess_value',
                                  decoration: inputStyle(
                                    'Excess Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.excessValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
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
                                  name: 'shortage_quantity',
                                  decoration: inputStyle(
                                    'Shortage Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setShortageValue(
                                        int.parse(value!),
                                      );

                                      _salesValueField.currentState!.didChange(
                                        invController.shortageValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FormBuilderTextField(
                                  key: _shortageValueField,
                                  enabled: false,
                                  name: 'shortage_value',
                                  decoration: inputStyle(
                                    'Shortage Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.shortageValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FormBuilderTextField(
                            name: 'remarks',
                            maxLines: 4,
                            decoration: inputStyle(
                              'Remarks',
                              null,
                              null,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_inventoryCreateFormKey.currentState!
                                  .validate()) {
                                final invCreateData = <String, dynamic>{
                                  'product_category': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_category']!
                                      .value,
                                  'product_name': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_name']!
                                      .value,
                                  'product_particulars': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_particulars']!
                                      .value,
                                  'client_name': _inventoryCreateFormKey
                                      .currentState!.fields['client_name']!.value,
                                  'per_unit_price': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['per_unit_price']!.value,
                                  ),
                                  'latest_stock': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['latest_stock']!.value,
                                  ),
                                  'physically_found_quantity': int.parse(
                                    _inventoryCreateFormKey
                                        .currentState!
                                        .fields['physically_found_quantity']!
                                        .value,
                                  ),
                                  'sales_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['sales_quantity']!.value,
                                  ),
                                  'purchase_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['purchase_quantity']!.value,
                                  ),
                                  'stock_quantity_to_be_reported': int.parse(
                                    _inventoryCreateFormKey
                                        .currentState!
                                        .fields['stock_quantity_to_be_reported']!
                                        .value,
                                  ),
                                  'excess_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['excess_quantity']!.value,
                                  ),
                                  'shortage_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['shortage_quantity']!.value,
                                  ),
                                };
                                await invController
                                    .createInventory(invCreateData);
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
                    phoneL: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            'Product Information',
                            style: TextStyle(fontSize: 18.0),
                          )),
                        ),
                        Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'product_name',
                                  decoration: inputStyle(
                                    'Product Name',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                        Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'client_name',
                                  decoration: inputStyle(
                                    'Client Name',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                        
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'product_category',
                                  decoration: inputStyle(
                                    'Product Category',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'per_unit_price',
                                  decoration: inputStyle(
                                    'Per Unit Price',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  initialValue: 0.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPerUnitPrice(
                                        int.parse(value!),
                                      );

                                      _physicallyFoundValueField.currentState!
                                          .didChange(
                                        invController.physicallyFoundValue,
                                      );
                                      _salesValueField.currentState!.didChange(
                                        invController.salesValue,
                                      );
                                      _purchaseValueField.currentState!.didChange(
                                        invController.purchaseValue,
                                      );
                                      _stockValueToBeReportedField.currentState!
                                          .didChange(
                                        invController.stockValueToBeReported,
                                      );
                                      _excessValueField.currentState!.didChange(
                                        invController.excessValue,
                                      );
                                      _shortageValueField.currentState!.didChange(
                                        invController.shortageValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
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
                                      (states) => invController.attachment == null
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
                                      ],
                                    );

                                    if (picked != null) {
                                      invController
                                          .setAttachment(picked.files.first);
                                      setState(
                                        () {
                                          upButtonIcon = Icons.image;
                                          upText = "An Image file named\n" +
                                              picked.files.first.name.toString() +
                                              '\nhas been Uploaded';
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                        Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'product_particulars',
                                  decoration: inputStyle(
                                    'Product Particulars',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                        Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'latest_stock',
                                  decoration: inputStyle(
                                    'Latest Stock',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                ),
                              ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                              child: Text(
                            'Product Stock Information',
                            style: TextStyle(fontSize: 18.0),
                          )),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'physically_found_quantity',
                                  decoration: inputStyle(
                                    'Physically Found Quantity',
                                    null,
                                    null,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  initialValue: 0.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPhysicallyFoundValue(
                                        int.parse(value!),
                                      );

                                      _physicallyFoundValueField.currentState!
                                          .didChange(
                                        invController.physicallyFoundValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _physicallyFoundValueField,
                                  enabled: false,
                                  name: 'physically_found_Value',
                                  decoration: inputStyle(
                                    'Physically Found Value',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      invController.physicallyFoundValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'sales_quantity',
                                  decoration: inputStyle(
                                    'Sales Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setSalesValue(
                                        int.parse(value!),
                                      );

                                      _salesValueField.currentState!.didChange(
                                        invController.salesValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _salesValueField,
                                  enabled: false,
                                  name: 'sales_value',
                                  decoration: inputStyle(
                                    'Sales Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.salesValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'purchase_quantity',
                                  decoration: inputStyle(
                                    'Purchase Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setPurchaseValue(
                                        int.parse(value!),
                                      );

                                      _purchaseValueField.currentState!.didChange(
                                        invController.purchaseValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _purchaseValueField,
                                  enabled: false,
                                  name: 'purchase_value',
                                  decoration: inputStyle(
                                    'Purchase Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.purchaseValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'stock_quantity_to_be_reported',
                                  decoration: inputStyle(
                                    'Stock Quantity to be Reported',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setStockValueToBeReported(
                                        int.parse(value!),
                                      );

                                      _stockValueToBeReportedField.currentState!
                                          .didChange(
                                        invController.stockValueToBeReported,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _stockValueToBeReportedField,
                                  enabled: false,
                                  name: 'stock_value_to_be_reported',
                                  decoration: inputStyle(
                                    'Stock Value to be Reported',
                                    null,
                                    null,
                                  ),
                                  initialValue:
                                      invController.stockValueToBeReported,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'excess_quantity',
                                  decoration: inputStyle(
                                    'Excess Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setExcessValue(
                                        int.parse(value!),
                                      );

                                      _excessValueField.currentState!.didChange(
                                        invController.excessValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _excessValueField,
                                  enabled: false,
                                  name: 'excess_value',
                                  decoration: inputStyle(
                                    'Excess Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.excessValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  name: 'shortage_quantity',
                                  decoration: inputStyle(
                                    'Shortage Quantity',
                                    null,
                                    null,
                                  ),
                                  initialValue: 0.toString(),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                    FormBuilderValidators.numeric(context),
                                  ]),
                                  onChanged: (value) {
                                    setState(() {
                                      invController.setShortageValue(
                                        int.parse(value!),
                                      );

                                      _salesValueField.currentState!.didChange(
                                        invController.shortageValue,
                                      );
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(7.5),
                                child: FormBuilderTextField(
                                  key: _shortageValueField,
                                  enabled: false,
                                  name: 'shortage_value',
                                  decoration: inputStyle(
                                    'Shortage Value',
                                    null,
                                    null,
                                  ),
                                  initialValue: invController.shortageValue,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(context),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: FormBuilderTextField(
                            name: 'remarks',
                            maxLines: 3,
                            decoration: inputStyle(
                              'Remarks',
                              null,
                              null,
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_inventoryCreateFormKey.currentState!
                                  .validate()) {
                                final invCreateData = <String, dynamic>{
                                  'product_category': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_category']!
                                      .value,
                                  'product_name': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_name']!
                                      .value,
                                  'product_particulars': _inventoryCreateFormKey
                                      .currentState!
                                      .fields['product_particulars']!
                                      .value,
                                  'client_name': _inventoryCreateFormKey
                                      .currentState!.fields['client_name']!.value,
                                  'per_unit_price': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['per_unit_price']!.value,
                                  ),
                                  'latest_stock': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['latest_stock']!.value,
                                  ),
                                  'physically_found_quantity': int.parse(
                                    _inventoryCreateFormKey
                                        .currentState!
                                        .fields['physically_found_quantity']!
                                        .value,
                                  ),
                                  'sales_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['sales_quantity']!.value,
                                  ),
                                  'purchase_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['purchase_quantity']!.value,
                                  ),
                                  'stock_quantity_to_be_reported': int.parse(
                                    _inventoryCreateFormKey
                                        .currentState!
                                        .fields['stock_quantity_to_be_reported']!
                                        .value,
                                  ),
                                  'excess_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['excess_quantity']!.value,
                                  ),
                                  'shortage_quantity': int.parse(
                                    _inventoryCreateFormKey.currentState!
                                        .fields['shortage_quantity']!.value,
                                  ),
                                };
                                await invController
                                    .createInventory(invCreateData);
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
                ),
              );
      },
    );
  }
}
