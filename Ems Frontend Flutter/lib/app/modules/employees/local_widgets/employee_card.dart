import 'package:adnems/app/data/models/user.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/propic_replacement.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/employees/employee_controller.dart';
import 'package:adnems/app/modules/employees/local_widgets/employee_details_popup.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeCard extends StatelessWidget {
  final User employee;
  final EmployeeController empController;
  const EmployeeCard({
    Key? key,
    required this.employee,
    required this.empController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: ResponsiveUI(
        desktop: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                width: 10.0,
                color: employee.active ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 25.0,
                          child: ClipOval(
                            child: Image.network(
                              employee.avater,
                              fit: BoxFit.fitHeight,
                              width: 50.0,
                              height: 50.0,
                              errorBuilder: (context, error, stackTrace) {
                                return ProPicReplacementText(
                                  name: employee.name,
                                  dimension: 50.0,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconTextCombo(
                            data: employee.name,
                            icon: Icons.person,
                          ),
                          IconTextCombo(
                            data: employee.designation,
                            icon: Icons.design_services_sharp,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconTextCombo(
                            data: employee.email,
                            icon: Icons.email_outlined,
                          ),
                          IconTextCombo(
                            data: employee.contactNumber,
                            icon: Icons.phone_enabled_outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    empController.canEditEmployeeInfo()
                        ? IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => Get.toNamed(
                              Routes.EMPLOYEESEDIT,
                              arguments: {
                                'employee': employee,
                              },
                            ),
                            tooltip: 'Edit Data',
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    employee.active
                        ? IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline_sharp,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              empController.deactivateEmployeeAccount(
                                employee.id,
                              );
                            },
                            tooltip: 'Deactivate Account',
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline_sharp,
                              color: Colors.greenAccent,
                            ),
                            onPressed: () {
                              empController.activateEmployeeAccount(
                                employee.id,
                              );
                            },
                            tooltip: 'Activate Account',
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.view_headline_sharp,
                      ),
                      onPressed: () {
                        Get.dialog(
                          EmployeeDetailsPopUp(
                            employee: employee,
                          ),
                        );
                      },
                      tooltip: 'View Details',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        tablet: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                width: 10.0,
                color: employee.active ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40.0,
                          child: ClipOval(
                            child: Image.network(
                              employee.avater,
                              fit: BoxFit.fitHeight,
                              width: 80.0,
                              height: 80.0,
                              errorBuilder: (context, error, stackTrace) {
                                return ProPicReplacementText(
                                  name: employee.name,
                                  dimension: 80.0,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: employee.name,
                                title: 'Name',
                                icon: Icons.person,
                              ),
                              IconTextCombo(
                                data: employee.designation,
                                title: 'Designation',
                                icon: Icons.design_services_sharp,
                              ),
                              IconTextCombo(
                                data: employee.email,
                                title: 'Email',
                                icon: Icons.email_outlined,
                              ),
                              IconTextCombo(
                                data: employee.contactNumber,
                                title: 'Contact Number',
                                icon: Icons.phone_enabled_outlined,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            empController.canEditEmployeeInfo()
                                ? IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => Get.toNamed(
                                      Routes.EMPLOYEESEDIT,
                                      arguments: {
                                        'employee': employee,
                                      },
                                    ),
                                    tooltip: 'Edit Data',
                                  )
                                : const SizedBox(
                                    height: 10,
                                  ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            employee.active
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      empController.deactivateEmployeeAccount(
                                        employee.id,
                                      );
                                    },
                                    tooltip: 'Deactivate Account',
                                  )
                                : IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.greenAccent,
                                    ),
                                    onPressed: () {
                                      empController.activateEmployeeAccount(
                                        employee.id,
                                      );
                                    },
                                    tooltip: 'Activate Account',
                                  ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.view_headline_sharp,
                              ),
                              onPressed: () {
                                Get.dialog(
                                  EmployeeDetailsPopUp(
                                    employee: employee,
                                  ),
                                );
                              },
                              tooltip: 'View Details',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
