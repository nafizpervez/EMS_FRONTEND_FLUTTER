import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'local_widgets/more_extended_details_edit.dart';

class ProfileExtendedEditScreen extends StatelessWidget {
  const ProfileExtendedEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      subScreen: Padding(
        padding: EdgeInsets.all(8.0),
        child: MoreExtendedDetailsEdit(),
      ),
    );
  }
}
