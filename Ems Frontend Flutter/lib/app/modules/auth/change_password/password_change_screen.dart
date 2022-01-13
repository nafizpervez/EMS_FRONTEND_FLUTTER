import 'package:adnems/app/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'local_widgets/password_change_form.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      subScreen: Container(
        padding: const EdgeInsets.all(30.0),
        child: const PasswordChangeForm(),
      ),
    );
  }
}
