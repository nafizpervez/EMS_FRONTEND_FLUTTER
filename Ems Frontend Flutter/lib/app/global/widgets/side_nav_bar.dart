import 'package:adnems/app/core/utils/constants/responsive_breakpoints.dart';
import 'package:adnems/app/modules/auth/login/auth_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'side_nav_bar_item.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _navController =
        ScrollController(debugLabel: 'navScrollScroll');

    final AuthController _authController =
        Get.find<AuthController>(tag: 'authfirst');
    return Expanded(
      child: ListView(
        controller: _navController,
        children: [
          const SideNavItem(
            name: 'Overview',
            icon: Icons.dashboard_outlined,
            route: Routes.OVERVIEW,
          ),
          const SideNavItem(
            name: 'Profile',
            icon: Icons.face_unlock_rounded,
            route: Routes.PROFILE,
          ),
          MediaQuery.of(context).size.width < ResponsivebBreakPoints.TABLET
              ? const SideNavItem(
                  name: 'To Do',
                  icon: Icons.schedule,
                  route: Routes.TODO,
                )
              : const SizedBox(
                  width: 10.0,
                ),
          const SideNavItem(
            name: 'Change Password',
            icon: Icons.change_circle_outlined,
            route: Routes.CHANGEPASSWORD,
          ),
          _authController.canSeeEmployeeList()
              ? const SideNavItem(
                  name: 'Employees',
                  icon: Icons.people_outline,
                  route: Routes.EMPLOYEES,
                )
              : const SizedBox(
                  width: 10.0,
                ),
          const SideNavItem(
            name: 'Schedule',
            icon: Icons.calendar_today,
            route: Routes.CALENDAR,
          ),
          const SideNavItem(
            name: 'Leave Application',
            icon: Icons.sick_outlined,
            route: Routes.LEAVECREATE,
          ),
          const SideNavItem(
            name: 'PR Application',
            icon: Icons.shopping_bag_outlined,
            route: Routes.PRCREATE,
          ),
          const SideNavItem(
            name: 'Conveyance Application',
            icon: Icons.monetization_on_outlined,
            route: Routes.CONVEYANCECREATE,
          ),
          const SideNavItem(
            name: 'Pending Approvals',
            icon: Icons.approval,
            route: Routes.APPROVAL,
          ),
          const SideNavItem(
            name: 'Sales Forecast',
            icon: Icons.attach_money_rounded,
            route: Routes.SALESFORCAST,
            agrguments: {'func': 'index'},
          ),
          const SideNavItem(
            name: 'Inventory',
            icon: Icons.inventory_2_outlined,
            route: Routes.INVENTORY,
          ),
        ],
      ),
    );
  }
}
