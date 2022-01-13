// ignore_for_file: constant_identifier_names

part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const CHANGEPASSWORD = '/change_password';
  static const PROFILE = '/profile';
  static const PROFILEEDIT = '/profile/edit';
  static const OVERVIEW = '/overview';

  static const EXTENDEDEDIT = '/extended/edit';

  static const TODO = '/todo';

  static const EMPLOYEES = '/employees';
  static const EMPLOYEESEDIT = '/employees/edit';
  static const EMPLOYEESCREATE = '/employees/create';

  static const INVENTORY = '/inventory';
  static const INVENTORYCREATE = '/inventory/create';
  static const INVENTORYEDIT = '/inventory/edit';

  static const SALESFORCAST = '/sales_forecast';
  static const SALESFORCASTCREATE = '/sales_forecast/create';
  static const SALESFORCASTEDIT = '/sales_forecast/edit';

  static const PR = '/purchase_requisition';
  static const PRCREATE = '/purchase_requisition/create';
  static const PREDIT = '/purchase_requisition/edit';

  static const LEAVE = '/leave';
  static const LEAVEEDIT = '/leave/edit';
  static const LEAVECREATE = '/leave/create';

  static const CONVEYANCE = '/conveyance';
  static const CONVEYANCEEDIT = '/conveyance/edit';
  static const CONVEYANCECREATE = '/conveyance/create';

  static const CALENDAR = '/calendar';

  static const APPROVAL = '/Approval';
}
