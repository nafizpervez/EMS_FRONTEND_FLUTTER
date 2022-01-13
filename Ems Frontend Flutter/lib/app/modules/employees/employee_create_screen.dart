import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/employee_create.dart';

class EmployeeCreateScreen extends StatelessWidget {
  const EmployeeCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      subScreen: EmployeeCreate(),
    );
  }
}
