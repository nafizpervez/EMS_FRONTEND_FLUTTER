import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/sales_forcast/local_widgets/sale_forcast_create.dart';
import 'package:flutter/material.dart';

class SalesForcastCreateScreen extends StatelessWidget {
  const SalesForcastCreateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(30.0),
        child: const SalesForcastCreate(),
      ),
    );
  }
}
