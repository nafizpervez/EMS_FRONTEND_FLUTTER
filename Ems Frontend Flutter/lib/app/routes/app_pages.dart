import 'package:adnems/app/modules/approvals/approval_binding.dart';
import 'package:adnems/app/modules/approvals/approval_screen.dart';
import 'package:adnems/app/modules/auth/change_password/password_change_screen.dart';
import 'package:adnems/app/modules/auth/login/auth_binding.dart';
import 'package:adnems/app/modules/auth/login/login_screen.dart';
import 'package:adnems/app/modules/calendar/calendar_binding.dart';
import 'package:adnems/app/modules/calendar/calendar_screen.dart';
import 'package:adnems/app/modules/conveyence/conveyance_binding.dart';
import 'package:adnems/app/modules/conveyence/conveyence_screen.dart';
import 'package:adnems/app/modules/dashboard/dash_middleware.dart';
import 'package:adnems/app/modules/dashboard/dashboard_binding.dart';
import 'package:adnems/app/modules/employees/employee_binding.dart';
import 'package:adnems/app/modules/employees/employee_create_screen.dart';
import 'package:adnems/app/modules/employees/employee_edit_screen.dart';
import 'package:adnems/app/modules/employees/employee_screen.dart';
import 'package:adnems/app/modules/inventory/inventory_binding.dart';
import 'package:adnems/app/modules/inventory/inventory_create_screen.dart';
import 'package:adnems/app/modules/inventory/inventory_edit_screen.dart';
import 'package:adnems/app/modules/leave/leave_binding.dart';
import 'package:adnems/app/modules/leave/leave_screen.dart';
import 'package:adnems/app/modules/overview/overview_binding.dart';
import 'package:adnems/app/modules/overview/overview_screen.dart';
import 'package:adnems/app/modules/inventory/inventory_screen.dart';
import 'package:adnems/app/modules/pr/pr_binding.dart';
import 'package:adnems/app/modules/pr/pr_screen.dart';
import 'package:adnems/app/modules/profile/local_widgets/more_extended_details.dart';
import 'package:adnems/app/modules/profile/local_widgets/more_extended_details_edit.dart';
import 'package:adnems/app/modules/profile/profile_binding.dart';
import 'package:adnems/app/modules/profile/profile_edit_screen.dart';
import 'package:adnems/app/modules/profile/profile_extended_edit_screen.dart';
import 'package:adnems/app/modules/profile/profile_screen.dart';
import 'package:adnems/app/modules/sales_forcast/sale_forcast_binding.dart';
import 'package:adnems/app/modules/sales_forcast/sales_forcast_create_screen.dart';
import 'package:adnems/app/modules/sales_forcast/sales_forcast_edit_screen.dart';
import 'package:adnems/app/modules/sales_forcast/sales_forcast_Index_screen.dart';
import 'package:adnems/app/modules/todo/todo_binding.dart';
import 'package:adnems/app/modules/todo/todo_screen.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      title: 'Initial',
      name: Routes.INITIAL,
      middlewares: [DashMiddleware()],
      binding: DashboardBinding(),
      page: () => const OverviewScreen(),
    ),
    GetPage(
      title: 'Login',
      name: Routes.LOGIN,
      middlewares: [DashMiddleware()],
      binding: AuthBinding(),
      page: () => const LoginScreen(),
    ),
    GetPage(
      title: 'Change_Password',
      name: Routes.CHANGEPASSWORD,
      middlewares: [DashMiddleware()],
      binding: DashboardBinding(),
      page: () => const PasswordChangeScreen(),
    ),
    GetPage(
      title: 'Todo',
      name: Routes.TODO,
      middlewares: [DashMiddleware()],
      binding: TodoBinding(),
      page: () => const ToDoScreen(),
    ),
    GetPage(
      title: 'Overview',
      name: Routes.OVERVIEW,
      binding: OverviewBinding(),
      middlewares: [DashMiddleware()],
      page: () => const OverviewScreen(),
    ),
    GetPage(
      title: 'Profile',
      name: Routes.PROFILE,
      bindings: [
        TodoBinding(),
        ProfileBinding(),
      ],
      middlewares: [DashMiddleware()],
      page: () => const ProfileScreen(),
    ),
    GetPage(
      title: 'Profile_Edit',
      name: Routes.PROFILEEDIT,
      binding: ProfileBinding(),
      middlewares: [DashMiddleware()],
      page: () => const ProfileEditScreen(),
    ),
    GetPage(
      title: 'Extended_Edit',
      name: Routes.EXTENDEDEDIT,
      binding: ProfileBinding(),
      middlewares: [DashMiddleware()],
      page: () => const ProfileExtendedEditScreen(),
    ),
    GetPage(
      title: 'Employees',
      name: Routes.EMPLOYEES,
      binding: EmployeeBinding(),
      middlewares: [DashMiddleware()],
      page: () => const EmployeeScreen(),
    ),
    GetPage(
      title: 'Employees_Create',
      name: Routes.EMPLOYEESCREATE,
      binding: EmployeeBinding(),
      middlewares: [DashMiddleware()],
      page: () => const EmployeeCreateScreen(),
    ),
    GetPage(
      title: 'Employees_Edit',
      name: Routes.EMPLOYEESEDIT,
      binding: EmployeeBinding(),
      middlewares: [DashMiddleware()],
      page: () => const EmployeeEditScreen(),
    ),
    GetPage(
      title: 'Inventory',
      name: Routes.INVENTORY,
      binding: InventoryBinding(),
      middlewares: [DashMiddleware()],
      page: () => const InventroyScreen(),
    ),
    GetPage(
      title: 'Inventory_Create',
      name: Routes.INVENTORYCREATE,
      binding: InventoryBinding(),
      middlewares: [DashMiddleware()],
      page: () => const InventoryCreateScreen(),
    ),
    GetPage(
      title: 'Inventory_Edit',
      name: Routes.INVENTORYEDIT,
      binding: InventoryBinding(),
      middlewares: [DashMiddleware()],
      page: () => const InventoryEditScreen(),
    ),
    GetPage(
      title: 'Sales_Forcast',
      name: Routes.SALESFORCAST,
      binding: SaleForcastBinding(),
      middlewares: [DashMiddleware()],
      page: () => const SalesForcastIndexScreen(),
    ),
    GetPage(
      title: 'Sales_Forcast_Create',
      name: Routes.SALESFORCASTCREATE,
      binding: SaleForcastBinding(),
      middlewares: [DashMiddleware()],
      page: () => const SalesForcastCreateScreen(),
    ),
    GetPage(
      title: 'Sales_Forcast_Edit',
      name: Routes.SALESFORCASTEDIT,
      binding: SaleForcastBinding(),
      middlewares: [DashMiddleware()],
      page: () => const SalesForcastEditScreen(),
    ),
    GetPage(
      title: 'Leave',
      name: Routes.LEAVE,
      binding: LeaveBinding(),
      middlewares: [DashMiddleware()],
      page: () => const LeaveScreen(
        page: 1,
      ),
    ),
    GetPage(
      title: 'Leave_Create',
      name: Routes.LEAVECREATE,
      binding: LeaveBinding(),
      middlewares: [DashMiddleware()],
      page: () => const LeaveScreen(
        page: 2,
      ),
    ),
    GetPage(
      title: 'PR',
      name: Routes.PR,
      binding: PRBinding(),
      middlewares: [DashMiddleware()],
      page: () => const PRScreen(
        page: 1,
      ),
    ),
    GetPage(
      title: 'PR_Create',
      name: Routes.PRCREATE,
      binding: PRBinding(),
      middlewares: [DashMiddleware()],
      page: () => const PRScreen(
        page: 2,
      ),
    ),
    GetPage(
      title: 'PR_Edit',
      name: Routes.PREDIT,
      binding: PRBinding(),
      middlewares: [DashMiddleware()],
      page: () => const PRScreen(
        page: 3,
      ),
    ),
    GetPage(
      title: 'Conveyance',
      name: Routes.CONVEYANCE,
      binding: ConveyanceBinding(),
      middlewares: [DashMiddleware()],
      page: () => const ConveyanceScreen(
        page: 1,
      ),
    ),
    GetPage(
      title: 'Conveyance_Create',
      name: Routes.CONVEYANCECREATE,
      binding: ConveyanceBinding(),
      middlewares: [DashMiddleware()],
      page: () => const ConveyanceScreen(
        page: 2,
      ),
    ),
    GetPage(
      title: 'Approval',
      name: Routes.APPROVAL,
      binding: ApprovalBinding(),
      middlewares: [DashMiddleware()],
      page: () => const ApprovalScreen(),
    ),
    GetPage(
      title: 'Calendar',
      name: Routes.CALENDAR,
      binding: CalendarEventBinding(),
      middlewares: [DashMiddleware()],
      page: () => const CalenderScreen(),
    ),
  ];
}
