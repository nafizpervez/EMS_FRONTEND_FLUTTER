import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/inventory_edit.dart';

class InventoryEditScreen extends StatelessWidget {
  const InventoryEditScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(30.0),
        child: InventoryEdit(
          inventory: Get.arguments['inventory'],
        ),
      ),
    );
  }
}
