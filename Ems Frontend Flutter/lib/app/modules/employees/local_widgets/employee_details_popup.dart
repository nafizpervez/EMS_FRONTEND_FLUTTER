import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/modules/profile/local_widgets/extended_details.dart';

import 'package:adnems/app/modules/profile/local_widgets/profile_details.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsPopUp extends StatelessWidget {
  final User employee;
  const EmployeeDetailsPopUp({
    Key? key,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _coDController =
        ScrollController(debugLabel: 'EnpDetailScroll');
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(controller: _coDController, children: [
            ProfileDetail(
              user: employee,
              showEdit: false,
            ),
            const SizedBox(height: 30.0),
            ExtendedDetails(
              user: employee,
            ),
          ]),
        ),
      ),
    );
  }
}
