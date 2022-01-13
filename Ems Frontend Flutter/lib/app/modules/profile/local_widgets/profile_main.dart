import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'extended_details.dart';
import 'more_extended_details.dart';
import 'profile_details.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>(
      tag: 'authfirst',
    );
    return ListView(
      children: [
        ProfileDetail(
          user: authC.user,
        ),
        const SizedBox(height: 25.0),
        ExtendedDetails(
          user: authC.user,
        ),
        const SizedBox(height: 25.0),
        const MoreExtendedDetails(),
      ],
    );
  }
}
