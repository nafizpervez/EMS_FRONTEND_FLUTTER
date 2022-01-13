import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/calendar_index.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(30.0),
        child: const CalenderIndex(),
      ),
    );
  }
}
