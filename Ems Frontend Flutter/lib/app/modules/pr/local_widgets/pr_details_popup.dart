import 'package:accordion/accordion.dart';
import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/purchase_requisition.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PRDetailsPopUp extends StatelessWidget {
  final PurchaseRequisition pr;
  const PRDetailsPopUp({
    Key? key,
    required this.pr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _prDController =
        ScrollController(debugLabel: 'PRDetailScroll');
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(
            controller: _prDController,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: pr.applicant.division,
                                title: 'Applicant Division',
                                icon: Icons.maps_home_work_outlined,
                              ),
                              IconTextCombo(
                                data: pr.applicant.department,
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
                          data: pr.applicant.division,
                          title: 'Applicant Division',
                          icon: Icons.maps_home_work_outlined,
                        ),
                        IconTextCombo(
                          data: pr.applicant.department,
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
                  'PR Information',
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: pr.serialId,
                                title: 'PR ID',
                                icon: Icons.format_list_numbered,
                              ),
                              IconTextCombo(
                                data:
                                    "${DateTime.parse(pr.applicationDate).day}-${DateTime.parse(pr.applicationDate).month}-${DateTime.parse(pr.applicationDate).year}",
                                title: 'Application Date',
                                icon: Icons.date_range,
                              ),
                              IconTextCombo(
                                data: pr.expanseType.capitalize.toString(),
                                title: 'Expense Type',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: pr.purposeOfPurchase.capitalize.toString(),
                                title: 'Purpose of Purchase',
                                icon: Icons.shopping_bag_outlined,
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
                                data: pr.user.capitalize.toString(),
                                title: 'User',
                                icon: Icons.person,
                              ),
                              IconTextCombo(
                                data: pr.status.capitalize.toString(),
                                title: 'Status',
                                icon: Icons.hourglass_bottom,
                              ),
                              IconTextCombo(
                                data: pr.comment,
                                title: 'Comment',
                                icon: Icons.comment,
                              ),
                              ...pr.attachments
                                  .map(
                                    (attachment) => MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (attachment.attachmentType
                                                      .toLowerCase() ==
                                                  'jpg' ||
                                              attachment.attachmentType
                                                      .toLowerCase() ==
                                                  'jpeg' ||
                                              attachment.attachmentType
                                                      .toLowerCase() ==
                                                  'png') {
                                            Get.dialog(
                                              AlertDialog(
                                                content: Center(
                                                  child: Image.network(
                                                    attachment.attachmentUrl,
                                                  ),
                                                ),
                                              ),
                                              name: 'photoview',
                                            );
                                          }
                                        },
                                        child: IconTextComboUnSelectable(
                                          data: 'Attachment ' +
                                              (pr.attachments.indexWhere(
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
                                                      'jpeg' ||
                                                  attachment.attachmentType
                                                          .toLowerCase() ==
                                                      'png'
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
                          data: pr.serialId,
                          title: 'PR ID',
                          icon: Icons.format_list_numbered,
                        ),
                        IconTextCombo(
                          data:
                              "${DateTime.parse(pr.applicationDate).day}-${DateTime.parse(pr.applicationDate).month}-${DateTime.parse(pr.applicationDate).year}",
                          title: 'Application Date',
                          icon: Icons.date_range,
                        ),
                        IconTextCombo(
                          data: pr.expanseType.capitalize.toString(),
                          title: 'Expense Type',
                          icon: Icons.attach_money_outlined,
                        ),
                        IconTextCombo(
                          data: pr.purposeOfPurchase.capitalize.toString(),
                          title: 'Purpose of Purchase',
                          icon: Icons.shopping_bag_outlined,
                        ),
                        IconTextCombo(
                          data: pr.user.capitalize.toString(),
                          title: 'User',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: pr.status.capitalize.toString(),
                          title: 'Status',
                          icon: Icons.hourglass_bottom,
                        ),
                        IconTextCombo(
                          data: pr.comment,
                          title: 'Comment',
                          icon: Icons.comment,
                        ),
                        ...pr.attachments
                            .map(
                              (attachment) => MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    if (attachment.attachmentType
                                                .toLowerCase() ==
                                            'jpg' ||
                                        attachment.attachmentType
                                                .toLowerCase() ==
                                            'jpeg' ||
                                        attachment.attachmentType
                                                .toLowerCase() ==
                                            'png') {
                                      Get.dialog(
                                        AlertDialog(
                                          content: Center(
                                            child: Image.network(
                                              attachment.attachmentUrl,
                                            ),
                                          ),
                                        ),
                                        name: 'photoview',
                                      );
                                    }
                                  },
                                  child: IconTextComboUnSelectable(
                                    data: 'Attachment ' +
                                        (pr.attachments.indexWhere(
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
                                                'jpeg' ||
                                            attachment.attachmentType
                                                    .toLowerCase() ==
                                                'png'
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
                  'Items Information',
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
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'SL',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...[
                              'Purchase Type',
                              'Item Description',
                              'ItemQuantity',
                              'Measurement Of Unit',
                              'RequiredDate',
                              'Estimated Unit Price',
                              'Estimated Total Price',
                            ]
                                .map(
                                  (itemD) => Expanded(
                                    flex: 3,
                                    child: Text(
                                      itemD.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ...pr.prItems
                            .map(
                              (item) => Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      (pr.prItems.indexOf(item) + 1).toString(),
                                    ),
                                  ),
                                  ...[
                                    item.purchaseType.capitalize.toString(),
                                    item.itemDescription.capitalize.toString(),
                                    item.itemQuantity,
                                    item.measurementOfUnit.capitalize.toString(),
                                    item.requiredDate,
                                    item.estimatedUnitPrice,
                                    item.estimatedTotalPrice,
                                  ]
                                      .map(
                                        (itemD) => Expanded(
                                          flex: 3,
                                          child: Text(
                                            itemD.toString(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ],
                              ),
                            )
                            .toList(),
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
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      child: Accordion(
                        headerBackgroundColor: ADNColorConstants.kADNLightGreen,
                        contentBorderColor: Colors.transparent,
                        maxOpenSections: 1,
                        headerPadding: const EdgeInsets.all(5.0),
                        children: pr.prItems.map((item){
                          return AccordionSection(
                            header: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(item.itemDescription, 
                              style: const TextStyle(color: ADNColorConstants.kADNWhite, 
                                              fontWeight: FontWeight.bold
                                              ),
                                            ),
                            ),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IconTextCombo(
                                  data: item.purchaseType,
                                  title: 'Purchase Type',
                                  ),
                                IconTextCombo(
                                  data: item.itemDescription,
                                  title: 'Item Description',
                                  ),
                                IconTextCombo(
                                  data: item.itemQuantity.toString(),
                                  title: 'Item Quantity',
                                  ),
                                IconTextCombo(
                                  data: item.measurementOfUnit,
                                  title: 'Measurement of Unit',
                                  ),
                                IconTextCombo(
                                  data: item.requiredDate,
                                  title: 'Required Date',
                                  ),
                                IconTextCombo(
                                  data: item.estimatedUnitPrice.toString(),
                                  title: 'Estimated Unit Price',
                                  ),
                                IconTextCombo(
                                  data: item.estimatedTotalPrice.toString(),
                                  title: 'Estimated Total Price',
                                  ),
                               ],
                              ),
                            );
                          },
                        ).toList(), 
                      ),
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
                      children: pr.approvals
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
                      children: pr.approvals
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
