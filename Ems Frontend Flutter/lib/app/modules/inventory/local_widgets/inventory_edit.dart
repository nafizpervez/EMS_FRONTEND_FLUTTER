import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/inventory.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/modules/inventory/inventory_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class InventoryEdit extends StatefulWidget {
  final Inventory inventory;
  const InventoryEdit({Key? key, required this.inventory}) : super(key: key);

  @override
  State<InventoryEdit> createState() => _InventoryEditTable();
}

class _InventoryEditTable extends State<InventoryEdit> {
  final GlobalKey<FormBuilderState> _inventoryCreateFormKey =
      GlobalKey<FormBuilderState>(debugLabel: 'SaleForcastCreateForm');

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
                  child: Column(
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
                                initialValue: widget.inventory.productName,
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
                                initialValue: widget.inventory.clientName,
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
                                initialValue: widget.inventory.productCategory,
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
                                initialValue:
                                    widget.inventory.perUnitPrice.toString(),
                                onChanged: (value) {
                                  setState(() {
                                    invController.setPerUnitPrice(
                                      int.parse(value!),
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
                                initialValue:
                                    widget.inventory.productParticulars,
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
                                initialValue:
                                    widget.inventory.latestStock.toString(),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'physically_found_quantity',
                          decoration: inputStyle(
                            'Physically Found Quantity',
                            null,
                            null,
                          ),
                          initialValue: widget.inventory.physicallyFoundQuantity
                              .toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setPhysicallyFoundValue(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'sales_quantity',
                          decoration: inputStyle(
                            'Sales Quantity',
                            null,
                            null,
                          ),
                          initialValue:
                              widget.inventory.salesQuantity.toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setSalesValue(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'purchase_quantity',
                          decoration: inputStyle(
                            'Purchase Quantity',
                            null,
                            null,
                          ),
                          initialValue:
                              widget.inventory.purchaseQuantity.toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setPurchaseValue(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'stock_quantity_to_be_reported',
                          decoration: inputStyle(
                            'Stock Quantity to be Reported',
                            null,
                            null,
                          ),
                          initialValue: widget
                              .inventory.stockQuantityToBeReported
                              .toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setStockValueToBeReported(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'excess_quantity',
                          decoration: inputStyle(
                            'Excess Quantity',
                            null,
                            null,
                          ),
                          initialValue:
                              widget.inventory.excessQuantity.toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setExcessValue(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FormBuilderTextField(
                          name: 'shortage_quantity',
                          decoration: inputStyle(
                            'Shortage Quantity',
                            null,
                            null,
                          ),
                          initialValue:
                              widget.inventory.shortageQuantity.toString(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                          ]),
                          onChanged: (value) {
                            setState(() {
                              invController.setShortageValue(
                                int.parse(value!),
                              );
                            });
                          },
                        ),
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
                              await invController.updateInventory(
                                invCreateData,
                                widget.inventory.id,
                              );
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
              );
      },
    );
  }
}
