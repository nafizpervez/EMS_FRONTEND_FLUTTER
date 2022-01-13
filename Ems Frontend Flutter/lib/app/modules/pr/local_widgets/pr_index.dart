import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/functions/input_style.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/approvals/approval_controller.dart';
import 'package:adnems/app/modules/pr/pr_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'pr_details_popup.dart';

class PRIndex extends StatelessWidget {
  const PRIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _pController =
        ScrollController(debugLabel: 'PRScroll');
    return GetX<PRController>(
      builder: (prController) {
        if (prController.prLoaded) {
          if (prController.getPRs().isEmpty) {
            return const Center(
              child: ResponsiveUI(
                desktop: Text(
                  'No Purchase Requisition Record Found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                phoneL: Text(
                  'No Purchase Requisition Record Found!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.60,
              child: Scrollbar(
                controller: _pController,
                isAlwaysShown: true,
                thickness: 3.0,
                hoverThickness: 3.0,
                child: ListView(
                  controller: _pController,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: prController
                      .getPRs()
                      .map(
                        (pr) => Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: 10.0,
                                color: Colors.greenAccent,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 5.0,
                              ),
                              child: ResponsiveUI(
                                desktop: Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 20.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconTextCombo(
                                                data: pr.serialId,
                                                title: 'PR ID',
                                                icon: Icons.sell_rounded,
                                              ),
                                              IconTextCombo(
                                                data: pr.applicant.name,
                                                title: 'Applicant Name',
                                                icon: Icons.person,
                                              ),
                                              IconTextCombo(
                                                data: pr.applicant.designation,
                                                title: 'Applicant Designation',
                                                icon: Icons.work_outline,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconTextCombo(
                                                data:
                                                    "${DateTime.parse(pr.applicationDate).day}-${DateTime.parse(pr.applicationDate).month}-${DateTime.parse(pr.applicationDate).year}",
                                                title: 'Application Date',
                                                icon: Icons.date_range_outlined,
                                              ),
                                              IconTextCombo(
                                                data: pr.user.capitalize
                                                    .toString(),
                                                title: 'User',
                                                icon: Icons.people,
                                              ),
                                              IconTextCombo(
                                                data: pr.expanseType.capitalize
                                                    .toString(),
                                                title: 'Expense Type',
                                                icon: Icons
                                                    .monetization_on_outlined,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  prController.getApproval(
                                                              pr) !=
                                                          null
                                                      ? IconButton(
                                                          tooltip:
                                                              'Approve / Reject',
                                                          onPressed: () {
                                                            final _approvController =
                                                                Get.find<
                                                                    ApprovalController>();
                                                            final GlobalKey<
                                                                    FormBuilderState>
                                                                _addRemarkFormKey =
                                                                GlobalKey<
                                                                        FormBuilderState>(
                                                                    debugLabel:
                                                                        'AddRemarkPRForm');
                                                            Get.dialog(
                                                              FadeInDown(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                child:
                                                                    AlertDialog(
                                                                  title:
                                                                      const Text(
                                                                    'Remark',
                                                                    style:
                                                                        TextStyle(
                                                                      color: ADNColorConstants
                                                                          .kADNGray,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  content:
                                                                      FormBuilder(
                                                                    key:
                                                                        _addRemarkFormKey,
                                                                    child:
                                                                        SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.8,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.8,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          FormBuilderTextField(
                                                                            name:
                                                                                'remark',
                                                                            decoration:
                                                                                inputStyle(
                                                                              'Add a Remark...',
                                                                              const Icon(Icons.question_answer),
                                                                              null,
                                                                            ),
                                                                            maxLines:
                                                                                3,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                20.0,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  final _ap = prController.getApproval(pr)!;

                                                                                  _approvController
                                                                                      .updateApproval(
                                                                                        ApprovalRequest(
                                                                                          id: _ap.id,
                                                                                          needApprovalFrom: _ap.needApprovalFrom,
                                                                                          status: 'approved',
                                                                                          canApprove: _ap.canApprove,
                                                                                          line: _ap.line,
                                                                                          remark: _addRemarkFormKey.currentState!.fields['remark']!.value.toString(),
                                                                                        ),
                                                                                      )
                                                                                      .whenComplete(
                                                                                        () => prController.retrivePRs().whenComplete(() {
                                                                                          Get.close(1);
                                                                                          Get.reload;
                                                                                        }),
                                                                                      );
                                                                                },
                                                                                child: const Text(
                                                                                  'Approve',
                                                                                ),
                                                                                style: ElevatedButton.styleFrom(
                                                                                  primary: Colors.green,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 20.0,
                                                                              ),
                                                                              ElevatedButton(
                                                                                onPressed: () {
                                                                                  final _ap = prController.getApproval(pr)!;

                                                                                  _approvController
                                                                                      .updateApproval(
                                                                                        ApprovalRequest(
                                                                                          id: _ap.id,
                                                                                          needApprovalFrom: _ap.needApprovalFrom,
                                                                                          status: 'rejected',
                                                                                          canApprove: _ap.canApprove,
                                                                                          line: _ap.line,
                                                                                          remark: _addRemarkFormKey.currentState!.fields['remark']!.value.toString(),
                                                                                        ),
                                                                                      )
                                                                                      .whenComplete(
                                                                                        () => prController.retrivePRs().whenComplete(() {
                                                                                          Get.close(1);
                                                                                          Get.reload;
                                                                                        }),
                                                                                      );
                                                                                },
                                                                                child: const Text(
                                                                                  'Reject',
                                                                                ),
                                                                                style: ElevatedButton.styleFrom(
                                                                                  primary: Colors.redAccent,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          icon: const Icon(
                                                            Icons
                                                                .approval_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                        )
                                                      : const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Get.dialog(
                                                        PRDetailsPopUp(
                                                          pr: pr,
                                                        ),
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      Icons.menu,
                                                      color: Colors.grey,
                                                    ),
                                                    tooltip: 'View Details',
                                                  ),
                                                  prController.canSeeEdit(
                                                          pr.approvals)
                                                      ? IconButton(
                                                          onPressed: () {
                                                            Get.offNamed(
                                                              Routes.PREDIT,
                                                              arguments: {
                                                                'pr': pr,
                                                              },
                                                            );
                                                          },
                                                          icon: const Icon(
                                                            Icons.edit,
                                                            color: Colors.grey,
                                                          ),
                                                          tooltip: 'Edit',
                                                        )
                                                      : const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                  prController.canSeeDelete(pr)
                                                      ? IconButton(
                                                          onPressed: () =>
                                                              prController
                                                                  .deletePR(pr),
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                          tooltip: 'Delete',
                                                        )
                                                      : const SizedBox(
                                                          height: 10.0,
                                                        ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: pr.approvals.map(
                                                  (approv) {
                                                    switch (approv.status) {
                                                      case 'approved':
                                                        return Tooltip(
                                                          child: const Icon(
                                                            Icons.done_all,
                                                            color: Colors.green,
                                                          ),
                                                          message: approv
                                                                  .needApprovalFrom
                                                                  .name +
                                                              '\n' +
                                                              approv.status
                                                                  .capitalize
                                                                  .toString(),
                                                        );
                                                      case 'rejected':
                                                        return Tooltip(
                                                          child: const Icon(
                                                            Icons
                                                                .cancel_outlined,
                                                            color: Colors.red,
                                                          ),
                                                          message: approv
                                                                  .needApprovalFrom
                                                                  .name +
                                                              '\n' +
                                                              approv.status
                                                                  .capitalize
                                                                  .toString(),
                                                        );
                                                      default:
                                                        return Tooltip(
                                                          child: const Icon(
                                                            Icons
                                                                .hourglass_bottom,
                                                            color: Colors.grey,
                                                          ),
                                                          message: approv
                                                                  .needApprovalFrom
                                                                  .name +
                                                              '\n' +
                                                              approv.status
                                                                  .capitalize
                                                                  .toString(),
                                                        );
                                                    }
                                                  },
                                                ).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                phoneL: Stack(
                                  children: [
                                    Card(
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 20.0,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IconTextCombo(
                                              data: pr.serialId,
                                              title: 'PR ID',
                                              icon: Icons.sell_rounded,
                                            ),
                                            IconTextCombo(
                                              data: pr.applicant.name,
                                              title: 'Applicant Name',
                                              icon: Icons.person,
                                            ),
                                            IconTextCombo(
                                              data: pr.applicant.designation,
                                              title: 'Applicant Designation',
                                              icon: Icons.work_outline,
                                            ),
                                            IconTextCombo(
                                              data:
                                                  "${DateTime.parse(pr.applicationDate).day}-${DateTime.parse(pr.applicationDate).month}-${DateTime.parse(pr.applicationDate).year}",
                                              title: 'Application Date',
                                              icon: Icons.date_range_outlined,
                                            ),
                                            IconTextCombo(
                                              data:
                                                  pr.user.capitalize.toString(),
                                              title: 'User',
                                              icon: Icons.people,
                                            ),
                                            IconTextCombo(
                                              data: pr.expanseType.capitalize
                                                  .toString(),
                                              title: 'Expense Type',
                                              icon: Icons
                                                  .monetization_on_outlined,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                prController.getApproval(pr) !=
                                                        null
                                                    ? IconButton(
                                                        tooltip:
                                                            'Approve / Reject',
                                                        onPressed: () {
                                                          final _approvController =
                                                              Get.find<
                                                                  ApprovalController>();
                                                          final GlobalKey<
                                                                  FormBuilderState>
                                                              _addRemarkFormKey =
                                                              GlobalKey<
                                                                      FormBuilderState>(
                                                                  debugLabel:
                                                                      'AddRemarkPRForm');
                                                          Get.dialog(
                                                            FadeInDown(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              child:
                                                                  AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  'Remark',
                                                                  style:
                                                                      TextStyle(
                                                                    color: ADNColorConstants
                                                                        .kADNGray,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                content:
                                                                    FormBuilder(
                                                                  key:
                                                                      _addRemarkFormKey,
                                                                  child:
                                                                      SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.8,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        FormBuilderTextField(
                                                                          name:
                                                                              'remark',
                                                                          decoration:
                                                                              inputStyle(
                                                                            'Add a Remark...',
                                                                            const Icon(Icons.question_answer),
                                                                            null,
                                                                          ),
                                                                          maxLines:
                                                                              3,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              20.0,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            ElevatedButton(
                                                                              onPressed: () {
                                                                                final _ap = prController.getApproval(pr)!;

                                                                                _approvController
                                                                                    .updateApproval(
                                                                                      ApprovalRequest(
                                                                                        id: _ap.id,
                                                                                        needApprovalFrom: _ap.needApprovalFrom,
                                                                                        status: 'approved',
                                                                                        canApprove: _ap.canApprove,
                                                                                        line: _ap.line,
                                                                                        remark: _addRemarkFormKey.currentState!.fields['remark']!.value.toString(),
                                                                                      ),
                                                                                    )
                                                                                    .whenComplete(
                                                                                      () => prController.retrivePRs().whenComplete(() {
                                                                                        Get.close(1);
                                                                                        Get.reload;
                                                                                      }),
                                                                                    );
                                                                              },
                                                                              child: const Text(
                                                                                'Approve',
                                                                              ),
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.green,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 20.0,
                                                                            ),
                                                                            ElevatedButton(
                                                                              onPressed: () {
                                                                                final _ap = prController.getApproval(pr)!;

                                                                                _approvController
                                                                                    .updateApproval(
                                                                                      ApprovalRequest(
                                                                                        id: _ap.id,
                                                                                        needApprovalFrom: _ap.needApprovalFrom,
                                                                                        status: 'rejected',
                                                                                        canApprove: _ap.canApprove,
                                                                                        line: _ap.line,
                                                                                        remark: _addRemarkFormKey.currentState!.fields['remark']!.value.toString(),
                                                                                      ),
                                                                                    )
                                                                                    .whenComplete(
                                                                                      () => prController.retrivePRs().whenComplete(() {
                                                                                        Get.close(1);
                                                                                        Get.reload;
                                                                                      }),
                                                                                    );
                                                                              },
                                                                              child: const Text(
                                                                                'Reject',
                                                                              ),
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.redAccent,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .approval_outlined,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    : const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                prController.canSeeEdit(
                                                        pr.approvals)
                                                    ? IconButton(
                                                        onPressed: () {
                                                          Get.offNamed(
                                                            Routes.PREDIT,
                                                            arguments: {
                                                              'pr': pr,
                                                            },
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          Icons.edit,
                                                          color: Colors.grey,
                                                        ),
                                                        tooltip: 'Edit',
                                                      )
                                                    : const SizedBox(
                                                        height: 10.0,
                                                      ),
                                                prController.canSeeDelete(pr)
                                                    ? IconButton(
                                                        onPressed: () =>
                                                            prController
                                                                .deletePR(pr),
                                                        icon: const Icon(
                                                          Icons.delete,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        tooltip: 'Delete',
                                                      )
                                                    : const SizedBox(
                                                        height: 10.0,
                                                      ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: pr.approvals.map(
                                                (approv) {
                                                  switch (approv.status) {
                                                    case 'approved':
                                                      return Tooltip(
                                                        child: const Icon(
                                                          Icons.done_all,
                                                          color: Colors.green,
                                                        ),
                                                        message: approv
                                                                .needApprovalFrom
                                                                .name +
                                                            '\n' +
                                                            approv.status
                                                                .capitalize
                                                                .toString(),
                                                      );
                                                    case 'rejected':
                                                      return Tooltip(
                                                        child: const Icon(
                                                          Icons.cancel_outlined,
                                                          color: Colors.red,
                                                        ),
                                                        message: approv
                                                                .needApprovalFrom
                                                                .name +
                                                            '\n' +
                                                            approv.status
                                                                .capitalize
                                                                .toString(),
                                                      );
                                                    default:
                                                      return Tooltip(
                                                        child: const Icon(
                                                          Icons
                                                              .hourglass_bottom,
                                                          color: Colors.grey,
                                                        ),
                                                        message: approv
                                                                .needApprovalFrom
                                                                .name +
                                                            '\n' +
                                                            approv.status
                                                                .capitalize
                                                                .toString(),
                                                      );
                                                  }
                                                },
                                              ).toList(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 5,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.dialog(
                                            PRDetailsPopUp(
                                              pr: pr,
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.menu,
                                          color: Colors.grey,
                                        ),
                                        tooltip: 'View Details',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ADNColorConstants.kADNLightGreen,
            ),
          );
        }
      },
    );
  }
}
