import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'local_widgets/sale_forcast_index.dart';

class SalesForcastIndexScreen extends StatelessWidget {
  const SalesForcastIndexScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveUI(
      desktop: DashboardScreen(
        subScreen: Padding(
          padding: EdgeInsets.all(25.0),
          child: SalesForcastIndex(),
        ),
      ),
      tablet: DashboardScreen(
        subScreen: Padding(
          padding: EdgeInsets.all(10.0),
          child: SalesForcastIndex(),
        ),
      ),
    );
  }
}
