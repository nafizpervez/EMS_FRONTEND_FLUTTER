import 'package:adnems/app/data/models/leave.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/global/widgets/show_attachment.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

class LeaveDetailsPopUp extends StatelessWidget {
  final Leave leave;
  const LeaveDetailsPopUp({
    Key? key,
    required this.leave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _lvDController =
        ScrollController(debugLabel: 'LeaveDetailScroll');
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(
            controller: _lvDController,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Text(
                  'Applicant Information',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ResponsiveUI(
                desktop: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data:
                                    "${DateTime.parse(leave.applicationDate).day}-${DateTime.parse(leave.applicationDate).month}-${DateTime.parse(leave.applicationDate).year}",
                                title: 'Applicanttion Date',
                                icon: Icons.date_range,
                              ),
                              IconTextCombo(
                                data: leave.applicant.name,
                                title: 'Applicant Name',
                                icon: Icons.person,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: leave.applicant.designation,
                                title: 'Applicant Designation',
                                icon: Icons.work_outline,
                              ),
                              IconTextCombo(
                                data: leave.applicant.division,
                                title: 'Applicant Division',
                                icon: Icons.maps_home_work_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                phoneL: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextCombo(
                          data:
                              "${DateTime.parse(leave.applicationDate).day}-${DateTime.parse(leave.applicationDate).month}-${DateTime.parse(leave.applicationDate).year}",
                          title: 'Applicanttion Date',
                          icon: Icons.date_range,
                        ),
                        IconTextCombo(
                          data: leave.applicant.name,
                          title: 'Applicant Name',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: leave.applicant.designation,
                          title: 'Applicant Designation',
                          icon: Icons.work_outline,
                        ),
                        IconTextCombo(
                          data: leave.applicant.division,
                          title: 'Applicant Division',
                          icon: Icons.maps_home_work_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Text(
                  'Leave Information',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ResponsiveUI(
                desktop: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconTextCombo(
                                    data: leave.leaveType.capitalize.toString(),
                                    title: 'Leave Type',
                                    icon: Icons.merge_type_sharp,
                                  ),
                                  IconTextCombo(
                                    data: leave.totalDays.toString() + ' days',
                                    title: 'Number of days',
                                    icon: Icons.confirmation_number_outlined,
                                  ),
                                  IconTextCombo(
                                    data: leave.details,
                                    title: 'Details',
                                    icon: Icons.menu_book_outlined,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconTextCombo(
                                    data: leave.startDate,
                                    title: 'Start Date',
                                    icon: Icons.date_range,
                                  ),
                                  IconTextCombo(
                                    data: leave.endDate,
                                    title: 'End Date',
                                    icon: Icons.date_range,
                                  ),
                                  ...leave.attachments
                                      .map(
                                        (attachment) => MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              showAttachment(attachment);
                                            },
                                            child: IconTextComboUnSelectable(
                                              data: 'Attachment ' +
                                                  (leave.attachments.indexWhere(
                                                              (element) =>
                                                                  element.id ==
                                                                  attachment.id) +
                                                          1)
                                                      .toString() +
                                                  '.' +
                                                  attachment.attachmentType
                                                      .toLowerCase() +
                                                  '(Click to See)',
                                              title: 'Attachment',
                                              icon: attachment.attachmentType
                                                              .toLowerCase() ==
                                                          'jpg' ||
                                                      attachment.attachmentType
                                                              .toLowerCase() ==
                                                          'png' ||
                                                      attachment.attachmentType
                                                              .toLowerCase() ==
                                                          'jpeg'
                                                  ? Icons.image
                                                  : Icons.attachment_outlined,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                phoneL: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextCombo(
                          data: leave.leaveType.capitalize.toString(),
                          title: 'Leave Type',
                          icon: Icons.merge_type_sharp,
                        ),
                        IconTextCombo(
                          data: leave.totalDays.toString() + ' days',
                          title: 'Number of days',
                          icon: Icons.confirmation_number_outlined,
                        ),
                        IconTextCombo(
                          data: leave.details,
                          title: 'Details',
                          icon: Icons.menu_book_outlined,
                        ),
                        IconTextCombo(
                          data: leave.startDate,
                          title: 'Start Date',
                          icon: Icons.date_range,
                        ),
                        IconTextCombo(
                          data: leave.endDate,
                          title: 'End Date',
                          icon: Icons.date_range,
                        ),
                        ...leave.attachments
                            .map(
                              (attachment) => MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    showAttachment(attachment);
                                  },
                                  child: IconTextComboUnSelectable(
                                    data: 'Attachment ' +
                                        (leave.attachments.indexWhere(
                                                    (element) =>
                                                        element.id ==
                                                        attachment.id) +
                                                1)
                                            .toString() +
                                        '.' +
                                        attachment.attachmentType
                                            .toLowerCase() +
                                        '(Click to See)',
                                    title: 'Attachment',
                                    icon: attachment.attachmentType
                                                    .toLowerCase() ==
                                                'jpg' ||
                                            attachment.attachmentType
                                                    .toLowerCase() ==
                                                'png' ||
                                            attachment.attachmentType
                                                    .toLowerCase() ==
                                                'jpeg'
                                        ? Icons.image
                                        : Icons.attachment_outlined,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Text(
                  'Emergency Contact',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconTextCombo(
                        data:
                            leave.emergencyContactPerson.capitalize.toString(),
                        title: 'Contact Person',
                        icon: Icons.person,
                      ),
                      IconTextCombo(
                        data: leave.emergencyContactNumber,
                        title: 'Contact Number',
                        icon: Icons.phone,
                      ),
                      IconTextCombo(
                        data: leave.emergencyContactAddress,
                        title: 'Contact Address',
                        icon: Icons.location_history_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Text(
                  'Approval Status',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ResponsiveUI(
                desktop: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: leave.approvals
                          .map(
                            (appro) => Row(
                              children: [
                                Expanded(
                                  child: IconTextCombo(
                                    data: appro.status.toUpperCase(),
                                    title: appro.needApprovalFrom.name,
                                    icon: appro.status == 'pending'
                                        ? Icons.hourglass_bottom_rounded
                                        : appro.status == 'approved'
                                            ? Icons.done_all
                                            : Icons.cancel_outlined,
                                  ),
                                ),
                                Expanded(
                                  child: IconTextCombo(
                                    data: appro.remark,
                                    title: 'Remark',
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                phoneL: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: leave.approvals
                          .map(
                            (appro) => Row(
                              children: [
                                Expanded(
                                  child: IconTextCombo(
                                    data: appro.needApprovalFrom.name,
                                  ),
                                ),
                                Icon(appro.status == 'pending'
                                        ? Icons.hourglass_bottom_rounded
                                        : appro.status == 'approved'
                                            ? Icons.done_all
                                            : Icons.cancel_outlined,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
