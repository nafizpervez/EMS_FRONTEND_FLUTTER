import 'package:adnems/app/core/utils/constants/responsive_breakpoints.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/global/widgets/side_bar.dart';
import 'package:adnems/app/global/widgets/top_nav_bar.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final Widget subScreen;
  const DashboardScreen({
    Key? key,
    required this.subScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.find<AuthController>(tag: 'authfirst');
    return Scaffold(
      drawer: MediaQuery.of(context).size.width > ResponsivebBreakPoints.TABLET
          ? null
          : const SideBar(),
      drawerEdgeDragWidth: 40.0,
      endDrawer:
          MediaQuery.of(context).size.width > ResponsivebBreakPoints.TABLET
              ? null
              : const SideBar(),
      body: Container(
        alignment: AlignmentDirectional.center,
        height: MediaQuery.of(context).size.height,
        child: ResponsiveUI(
          desktop: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SideBar(),
              Expanded(
                child: Column(
                  children: [
                    const TopNavBar(),
                    Expanded(
                      child: subScreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
          tablet: Column(
            children: [
              const TopNavBar(),
              Expanded(
                child: subScreen,
              ),
            ],
          ),
          phoneL: Column(
            children: [
              const TopNavBar(),
              Expanded(
                child: subScreen,
              ),
            ],
          ),
          phoneS: Column(
            children: [
              const TopNavBar(),
              Expanded(
                child: subScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
