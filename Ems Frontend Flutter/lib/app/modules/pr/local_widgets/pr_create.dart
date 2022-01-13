import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/form_section_title.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:animate_do/animate_do.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:adnems/app/data/models/pr_item.dart';
import 'package:adnems/app/modules/pr/pr_controller.dart';

class PRCreate extends StatefulWidget {
  const PRCreate({Key? key}) : super(key: key);

  @override
  State<PRCreate> createState() => _PRCreateState();
}

class _PRCreateState extends State<PRCreate> {
  final AuthController authC = Get.find<AuthController>(
    tag: 'authfirst',
  );
  final GlobalKey<FormBuilderState> _prFormKey = GlobalKey<FormBuilderState>();

  final ScrollController _scC = ScrollController(debugLabel: 'prFormScroll');

  var upText = 'UPLOAD FILE';
  var upButtonIcon = Icons.cloud_upload;

  @override
  Widget build(BuildContext context) {
    return GetX<PRController>(
      builder: (prController) {
        return prController.prCreating
            ? const Center(
                child: CircularProgressIndicator(
                  color: ADNColorConstants.kADNLightGreen,
                ),
              )
            : FormBuilder(
                key: _prFormKey,
                child: SingleChildScrollView(
                  controller: _scC,
                  child: ResponsiveUI(
                    desktop: Column(
                      children: [
                        const FormSectionTitle(
                          title: 'Applicant Information',
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
                                        textCapitalization:
                                            TextCapitalization.words,
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
                                        textCapitalization:
                                            TextCapitalization.words,
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
                                        textCapitalization:
                                            TextCapitalization.words,
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
                                      (states) => prController.attachment ==
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
                                        'pdf',
                                        'jpeg',
                                        'png',
                                      ],
                                    );

                                    if (picked != null) {
                                      prController
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
                          title: 'PR Information',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderDropdown(
                                  name: 'expanse_type',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  allowClear: true,
                                  focusColor: Colors.transparent,
                                  decoration: inputStyle(
                                    'Expense Type',
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
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FormBuilderChoiceChip(
                                  name: 'is_it_equipment',
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: inputStyle(
                                    'IT Equipment?',
                                    null,
                                    null,
                                  ),
                                  initialValue: false,
                                  alignment: WrapAlignment.spaceEvenly,
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: true,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('Yes'),
                                      ),
                                    ),
                                    FormBuilderFieldOption(
                                      value: false,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text('No'),
                                      ),
                                    ),
                                  ],
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
                          children: List.generate(
                            prController.itemCount,
                            (index) => Card(
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
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    prController.incrementItemCount();
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) =>
                                          ADNColorConstants.kADNLightGreen,
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
                                    prController.decreamentItemCount();
                                  },
                                  icon: const Icon(Icons.remove),
                                  label: const Text('Remove Item'),
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
                                final List<PrItem> _prItems = List.generate(
                                  prController.itemCount,
                                  (index) => PrItem(
                                    id: index.toString(),
                                    purchaseType: _prFormKey
                                        .currentState!
                                        .fields['purchase_type_${index + 1}']!
                                        .value,
                                    itemDescription: _prFormKey
                                        .currentState!
                                        .fields[
                                            'item_description_${index + 1}']!
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
                                            .fields[
                                                'required_date_${index + 1}']!
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

                                final prCreateData = <String, dynamic>{
                                  'expanse_type': _prFormKey.currentState!
                                      .fields['expanse_type']!.value,
                                  'line_manager_id': _prFormKey.currentState!
                                      .fields['line_manager_id']!.value
                                      .toString(),
                                  'is_it_equipment': _prFormKey.currentState!
                                      .fields['is_it_equipment']!.value,
                                  'purpose_of_purchase': _prFormKey
                                      .currentState!
                                      .fields['purpose_of_purchase']!
                                      .value,
                                  'user': _prFormKey
                                      .currentState!.fields['user']!.value,
                                  'comment': _prFormKey
                                      .currentState!.fields['comment']!.value,
                                };

                                if (_prItems.isNotEmpty) {
                                  prCreateData.addAll(
                                    {
                                      'items': List<dynamic>.from(
                                        _prItems.map(
                                          (x) => x.toJson(),
                                        ),
                                      ),
                                    },
                                  );
                                }

                                await prController.createPR(prCreateData);
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
                    phoneL: Column(
                      children: [
                        const FormSectionTitle(
                          title: 'Applicant Information',
                        ),
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
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(context),
                              ],
                            ),
                            initialValue: DateTime.now().subtract(
                              const Duration(days: 90),
                            ),
                            enabled: false,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'name',
                            textCapitalization: TextCapitalization.words,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'designation',
                            textCapitalization: TextCapitalization.words,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'department',
                            textCapitalization: TextCapitalization.words,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
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
                                (states) => prController.attachment == null
                                    ? Colors.blue
                                    : ADNColorConstants.kADNLightGreen,
                              ),
                            ),
                            onPressed: () async {
                              var picked = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: [
                                  'jpg',
                                  'pdf',
                                  'jpeg',
                                  'png',
                                ],
                              );

                              if (picked != null) {
                                prController.setAttachment(picked.files.first);
                                setState(
                                  () {
                                    switch (picked.files.first.extension
                                        .toString()
                                        .toLowerCase()) {
                                      case 'jpg':
                                        upButtonIcon = Icons.image;
                                        upText = "An Image file named\n" +
                                            picked.files.first.name.toString() +
                                            '\nhas been Uploaded';
                                        break;
                                      case 'jpeg':
                                        upButtonIcon = Icons.image;
                                        upText = "An Image file named\n" +
                                            picked.files.first.name.toString() +
                                            '\nhas been Uploaded';
                                        break;
                                      case 'png':
                                        upButtonIcon = Icons.image;
                                        upText = "An Image file named\n" +
                                            picked.files.first.name.toString() +
                                            '\nhas been Uploaded';
                                        break;
                                      case 'pdf':
                                        upButtonIcon = Icons.picture_as_pdf;
                                        upText = "A pdf file named\n" +
                                            picked.files.first.name.toString() +
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
                          title: 'PR Information',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderDropdown(
                            name: 'expanse_type',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            allowClear: true,
                            focusColor: Colors.transparent,
                            decoration: inputStyle(
                              'Expense Type',
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderChoiceChip(
                            name: 'is_it_equipment',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: inputStyle(
                              'IT Equipment?',
                              null,
                              null,
                            ),
                            initialValue: false,
                            alignment: WrapAlignment.spaceEvenly,
                            options: const [
                              FormBuilderFieldOption(
                                value: true,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('Yes'),
                                ),
                              ),
                              FormBuilderFieldOption(
                                value: false,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text('No'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'purpose_of_purchase',
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: inputStyle(
                              'Purpose of Purchase',
                              null,
                              null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'user',
                            textCapitalization: TextCapitalization.words,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FormBuilderTextField(
                            name: 'comment',
                            maxLines: 2,
                            decoration: inputStyle(
                              'Comment',
                              null,
                              null,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const FormSectionTitle(
                          title: 'Item List',
                        ),
                        Column(
                          children: List.generate(
                            prController.itemCount,
                            (index) => Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderTextField(
                                              name: 'sl_${index + 1}',
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
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderTextField(
                                              name:
                                                  'item_description_${index + 1}',
                                              decoration: inputStyle(
                                                'Item Description',
                                                null,
                                                null,
                                              ),
                                              validator:
                                                  FormBuilderValidators.compose(
                                                [
                                                  FormBuilderValidators
                                                      .required(context),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
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
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderTextField(
                                              name:
                                                  'estimated_unit_price_${index + 1}',
                                              decoration: inputStyle(
                                                'Estimated Unit Price',
                                                null,
                                                null,
                                              ),
                                              validator:
                                                  FormBuilderValidators.compose(
                                                [
                                                  FormBuilderValidators.integer(
                                                      context),
                                                  FormBuilderValidators
                                                      .required(context),
                                                ],
                                              ),
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
                                              items: prController.purchaseTypes
                                                  .map(
                                                    (e) => DropdownMenuItem(
                                                      child: Text(e
                                                          .replaceAll('_', ' ')
                                                          .capitalize!),
                                                      value: (e),
                                                    ),
                                                  )
                                                  .toList(),
                                              validator:
                                                  FormBuilderValidators.compose(
                                                [
                                                  FormBuilderValidators
                                                      .required(context),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderTextField(
                                              name:
                                                  'item_quantity_${index + 1}',
                                              decoration: inputStyle(
                                                'Item Quantity',
                                                null,
                                                null,
                                              ),
                                              validator:
                                                  FormBuilderValidators.compose(
                                                [
                                                  FormBuilderValidators.integer(
                                                      context),
                                                  FormBuilderValidators
                                                      .required(context),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderDateTimePicker(
                                              name:
                                                  'required_date_${index + 1}',
                                              inputType: InputType.date,
                                              decoration: inputStyle(
                                                'Required Date',
                                                null,
                                                null,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: FormBuilderTextField(
                                              name:
                                                  'estimated_total_price_${index + 1}',
                                              decoration: inputStyle(
                                                'Estimated Total Price',
                                                null,
                                                null,
                                              ),
                                              validator:
                                                  FormBuilderValidators.compose(
                                                [
                                                  FormBuilderValidators.integer(
                                                      context),
                                                  FormBuilderValidators
                                                      .required(context),
                                                ],
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
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ResponsiveUI(
                          desktop: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      prController.incrementItemCount();
                                    },
                                    icon: const Icon(Icons.add),
                                    label: const Text('Add Item'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                        (states) =>
                                            ADNColorConstants.kADNLightGreen,
                                      ),
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
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      prController.decreamentItemCount();
                                    },
                                    icon: const Icon(Icons.remove),
                                    label: const Text('Remove Item'),
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
                          phoneL: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    prController.incrementItemCount();
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) =>
                                          ADNColorConstants.kADNLightGreen,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    prController.decreamentItemCount();
                                  },
                                  icon: const Icon(Icons.remove),
                                  label: const Text('Remove Item'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) => Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              if (_prFormKey.currentState!.validate()) {
                                final List<PrItem> _prItems = List.generate(
                                  prController.itemCount,
                                  (index) => PrItem(
                                    id: index.toString(),
                                    purchaseType: _prFormKey
                                        .currentState!
                                        .fields['purchase_type_${index + 1}']!
                                        .value,
                                    itemDescription: _prFormKey
                                        .currentState!
                                        .fields[
                                            'item_description_${index + 1}']!
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
                                            .fields[
                                                'required_date_${index + 1}']!
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

                                final prCreateData = <String, dynamic>{
                                  'expanse_type': _prFormKey.currentState!
                                      .fields['expanse_type']!.value,
                                  'line_manager_id': _prFormKey.currentState!
                                      .fields['line_manager_id']!.value
                                      .toString(),
                                  'is_it_equipment': _prFormKey.currentState!
                                      .fields['is_it_equipment']!.value,
                                  'purpose_of_purchase': _prFormKey
                                      .currentState!
                                      .fields['purpose_of_purchase']!
                                      .value,
                                  'user': _prFormKey
                                      .currentState!.fields['user']!.value,
                                  'comment': _prFormKey
                                      .currentState!.fields['comment']!.value,
                                };

                                if (_prItems.isNotEmpty) {
                                  prCreateData.addAll(
                                    {
                                      'items': List<dynamic>.from(
                                        _prItems.map(
                                          (x) => x.toJson(),
                                        ),
                                      ),
                                    },
                                  );
                                }

                                await prController.createPR(prCreateData);
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
                  ),
                ),
              );
      },
    );
  }
}
