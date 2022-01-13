import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/inventory_index.dart';

class InventroyScreen extends StatelessWidget {
  const InventroyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveUI(
      desktop: DashboardScreen(
        subScreen: Padding(
          padding: EdgeInsets.all(25.0),
          child: InventorIndex(),
        ),
      ),
      tablet: DashboardScreen(
        subScreen: Padding(
          padding: EdgeInsets.all(10.0),
          child: InventorIndex(),
        ),
      ),
    );
  }
}
