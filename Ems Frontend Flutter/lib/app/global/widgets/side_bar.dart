import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/side_nav_bar.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>(tag: 'authfirst');
    return Container(
      width: 270.0,
      decoration: const BoxDecoration(
        color: ADNColorConstants.kADNBlack,
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SideNavBar(),
          const SizedBox(
            height: 20.0,
          ),
          Obx(
            () => authC.loggingOut
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : ElevatedButton.icon(
                    onPressed: () {
                      authC.logout();
                    },
                    icon: const Icon(Icons.power_settings_new_outlined),
                    label: const Text(
                      'Logout',
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.all(15.0),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
