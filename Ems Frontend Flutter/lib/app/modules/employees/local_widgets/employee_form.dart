// import 'package:adnems/app/data/models/user.dart';
// import 'package:adnems/app/global/functions/input_style.dart';
// import 'package:adnems/app/modules/employees/employee_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import 'employee_form_controller.dart';

// class EmployeeForm extends StatelessWidget {
//   final User user;
//   final EmployeeController controller;
//   const EmployeeForm({Key? key, required this.user, required this.controller})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey _employeeFormKey =
//         GlobalKey<FormBuilderState>(debugLabel: '_employeeFormState');

//     final EmployeeFormController formController =
//         Get.put<EmployeeFormController>(
//       EmployeeFormController(user),
//     );
//     return Container(
//       padding: const EdgeInsets.all(30.0),
//       width: MediaQuery.of(context).size.width * 0.9,
//       child: Column(
//         children: [
//           Expanded(
//             child: FormBuilder(
//               key: _employeeFormKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: ListView(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: FormBuilderTextField(
//                           name: 'name',
//                           initialValue: user.name,
//                           decoration: inputStyle(
//                             'Name',
//                             const Icon(Icons.people),
//                             null,
//                           ),
//                           validator: FormBuilderValidators.compose([
//                             FormBuilderValidators.required(context),
//                           ]),
//                           keyboardType: TextInputType.text,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20.0,
//                       ),
//                       Expanded(
//                         child: FormBuilderTextField(
//                           name: 'email',
//                           initialValue: user.email,
//                           decoration: inputStyle(
//                             'Email',
//                             const Icon(Icons.email_outlined),
//                             null,
//                           ),
//                           validator: FormBuilderValidators.compose([
//                             FormBuilderValidators.required(context),
//                             FormBuilderValidators.email(context),
//                           ]),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: FormBuilderTextField(
//                           name: 'phone',
//                           initialValue: user.contactNumber,
//                           decoration: inputStyle(
//                             'Phone',
//                             const Icon(Icons.phone_outlined),
//                             null,
//                           ),
//                           validator: FormBuilderValidators.compose([
//                             FormBuilderValidators.required(context),
//                           ]),
//                           keyboardType: TextInputType.phone,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20.0,
//                       ),
//                       Expanded(
//                         child: FormBuilderTextField(
//                           name: 'location',
//                           initialValue: user.location,
//                           decoration: inputStyle(
//                             'Location',
//                             const Icon(Icons.location_on_outlined),
//                             null,
//                           ),
//                           validator: FormBuilderValidators.compose([
//                             FormBuilderValidators.required(context),
//                           ]),
//                           keyboardType: TextInputType.text,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 20.0,
//                       ),
//                       Expanded(
//                         child: FormBuilderDateTimePicker(
//                           name: 'dateOfJoining',
//                           inputType: InputType.date,
//                           decoration: inputStyle(
//                             'Date of Joining',
//                             const Icon(Icons.calendar_today_outlined),
//                             null,
//                           ),
//                           format: DateFormat("dd-MM-yyyy"),
//                           initialDate: DateTime.parse(user.dateOfJoining),
//                           initialValue: DateTime.parse(user.dateOfJoining),
//                           enabled: true,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
