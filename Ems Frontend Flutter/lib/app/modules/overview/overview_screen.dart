import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/overview_index.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      subScreen: OverviewIndex(),
    );
  }
}
