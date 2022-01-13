import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:adnems/app/modules/pr/local_widgets/pr_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/pr_create.dart';
import 'local_widgets/pr_index.dart';

class PRScreen extends StatelessWidget {
  final int page;
  const PRScreen({
    Key? key,
    this.page = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 1:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(25.0),
            child: const PRIndex(),
          ),
        );
      case 2:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(15.0),
            child: const PRCreate(),
          ),
        );
      case 3:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(15.0),
            child: PREdit(
              pr: Get.arguments['pr'],
            ),
          ),
        );
      default:
        return DashboardScreen(
          subScreen: Container(
            padding: const EdgeInsets.all(25.0),
            child: const PRIndex(),
          ),
        );
    }
  }
}
