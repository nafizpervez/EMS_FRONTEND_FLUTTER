import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/sales_forcast/local_widgets/sale_forcast_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesForcastEditScreen extends StatelessWidget {
  const SalesForcastEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(30.0),
        child: SalesForcastEdit(
          saleF: Get.arguments['saleF'],
        ),
      ),
    );
  }
}
