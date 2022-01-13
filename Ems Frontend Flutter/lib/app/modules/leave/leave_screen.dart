import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/leave_create.dart';
import 'local_widgets/leave_index.dart';

class LeaveScreen extends StatelessWidget {
  final int page;
  const LeaveScreen({
    Key? key,
    this.page = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 1:
        return const DashboardScreen(
          subScreen: Padding(
            padding: EdgeInsets.all(25.0),
            child: LeaveIndex(),
          ),
        );
      case 2:
        return const DashboardScreen(
          subScreen: Padding(
            padding: EdgeInsets.all(15.0),
            child: LeaveCreate(),
          ),
        );
      default:
        return const DashboardScreen(
          subScreen: Padding(
            padding: EdgeInsets.all(25.0),
            child: LeaveIndex(),
          ),
        );
    }
  }
}
