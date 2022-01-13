import 'package:adnems/app/data/models/conveyance.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:intl/intl.dart';

class ConvDetailsPopUp extends StatelessWidget {
  final Conveyance conv;
  const ConvDetailsPopUp({
    Key? key,
    required this.conv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _coDController =
        ScrollController(debugLabel: 'ConvDetailScroll');
    final nv = NumberFormat.simpleCurrency(name: 'BDT');
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(
            controller: _coDController,
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
                                data: conv.applicant.name,
                                title: 'Applicant Name',
                                icon: Icons.person,
                              ),
                              IconTextCombo(
                                data: conv.applicant.designation,
                                title: 'Applicant Designation',
                                icon: Icons.work_outline,
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
                                data: conv.applicant.division,
                                title: 'Applicant Division',
                                icon: Icons.maps_home_work_outlined,
                              ),
                              IconTextCombo(
                                data: conv.applicant.department,
                                title: 'Applicant Department',
                                icon: Icons.home_work_outlined,
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
                          data: conv.applicant.name,
                          title: 'Applicant Name',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: conv.applicant.designation,
                          title: 'Applicant Designation',
                          icon: Icons.work_outline,
                        ),
                        IconTextCombo(
                          data: conv.applicant.division,
                          title: 'Applicant Division',
                          icon: Icons.maps_home_work_outlined,
                        ),
                        IconTextCombo(
                          data: conv.applicant.department,
                          title: 'Applicant Department',
                          icon: Icons.home_work_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Text(
                  'Conveyance Bill Information',
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
                                    data: conv.conveyanceType.capitalize
                                        .toString(),
                                    title: 'Conveyance Type',
                                    icon: Icons.person,
                                  ),
                                  IconTextCombo(
                                    data: DateFormat("dd-MM-yyyy")
                                        .add_jm()
                                        .format(DateTime.parse(conv.inTime))
                                        .toString(),
                                    title: 'In Time',
                                    icon: Icons.timelapse_outlined,
                                  ),
                                  IconTextCombo(
                                    data: conv.from.capitalize.toString(),
                                    title: 'Travel From',
                                    icon: Icons.location_on_outlined,
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
                                    data: conv.status.capitalize.toString(),
                                    title: 'Status',
                                    icon: Icons.hourglass_bottom,
                                  ),
                                  IconTextCombo(
                                    data: DateFormat("dd-MM-yyyy")
                                        .add_jm()
                                        .format(DateTime.parse(conv.outTime))
                                        .toString(),
                                    title: 'In Time',
                                    icon: Icons.timelapse_outlined,
                                  ),
                                  IconTextCombo(
                                    data: conv.to.capitalize.toString(),
                                    title: 'Travel To',
                                    icon: Icons.location_on_outlined,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: IconTextCombo(
                                data: nv.format(conv.payableAmount),
                                title: 'Payable Amount',
                                icon: Icons.attach_money_outlined,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: IconTextCombo(
                                data: conv.details,
                                title: 'Further Details',
                                icon: Icons.description,
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
                          data: conv.conveyanceType.capitalize.toString(),
                          title: 'Conveyance Type',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: DateFormat("dd-MM-yyyy")
                              .add_jm()
                              .format(DateTime.parse(conv.inTime))
                              .toString(),
                          title: 'In Time',
                          icon: Icons.timelapse_outlined,
                        ),
                        IconTextCombo(
                          data: conv.from.capitalize.toString(),
                          title: 'Travel From',
                          icon: Icons.location_on_outlined,
                        ),
                        IconTextCombo(
                          data: conv.status.capitalize.toString(),
                          title: 'Status',
                          icon: Icons.hourglass_bottom,
                        ),
                        IconTextCombo(
                          data: DateFormat("dd-MM-yyyy")
                              .add_jm()
                              .format(DateTime.parse(conv.outTime))
                              .toString(),
                          title: 'Out Time',
                          icon: Icons.timelapse_outlined,
                        ),
                        IconTextCombo(
                          data: conv.to.capitalize.toString(),
                          title: 'Travel To',
                          icon: Icons.location_on_outlined,
                        ),
                        IconTextCombo(
                          data: nv.format(conv.payableAmount),
                          title: 'Payable Amount',
                          icon: Icons.attach_money_outlined,
                        ),
                        IconTextCombo(
                          data: conv.details,
                          title: 'Further Details',
                          icon: Icons.description,
                        ),
                      ],
                    ),
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
                      children: conv.approvals
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
                      children: conv.approvals
                          .map(
                            (appro) => Row(
                              children: [
                                Expanded(
                                  child: IconTextCombo(
                                    data: appro.needApprovalFrom.name,
                                  ),
                                ),
                                Icon(
                                  appro.status == 'pending'
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
