import 'package:adnems/app/modules/conveyence/local_widgets/conveyence_create.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/conveyance_index.dart';

class ConveyanceScreen extends StatelessWidget {
  final int page;
  const ConveyanceScreen({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 1:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(25.0),
            child: const ConveyanceIndex(),
          ),
        );
      case 2:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(15.0),
            child: const ConveyanceCreate(),
          ),
        );
      default:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(25.0),
            child: const ConveyanceIndex(),
          ),
        );
    }
  }
}
