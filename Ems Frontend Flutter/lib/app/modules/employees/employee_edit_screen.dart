import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/employee_edit.dart';

class EmployeeEditScreen extends StatelessWidget {
  const EmployeeEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: EmployeeEdit(
        employee: Get.arguments['employee'],
      ),
    );
  }
}
