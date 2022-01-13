import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/sale_forcast.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/sales_forcast/sale_forcast_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SaleForcastDetailsPopUp extends StatelessWidget {
  final SaleForcast saleForcast;
  const SaleForcastDetailsPopUp({
    Key? key,
    required this.saleForcast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _lvDController =
        ScrollController(debugLabel: 'SFDetailScroll');
    final SaleForcastController sffController =
        Get.find<SaleForcastController>();
    final nv = NumberFormat.simpleCurrency(name: 'BDT');
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  controller: _lvDController,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      child: Text(
                        'Project Information',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconTextCombo(
                                      data: saleForcast.projectName,
                                      title: 'Project Name',
                                      icon: Icons.work_outline_sharp,
                                    ),
                                    IconTextCombo(
                                      data: saleForcast.nameOfTheAccount,
                                      title: 'Name of the Account',
                                      icon: Icons.account_balance,
                                    ),
                                    IconTextCombo(
                                      data: saleForcast.probabilityOfClosing
                                              .capitalize! +
                                          (saleForcast.probabilityOfClosing ==
                                                  'No Data'
                                              ? ''
                                              : ' %'),
                                      title: 'Probability of Clossing',
                                      icon: Icons.confirmation_number_outlined,
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
                                      data: saleForcast.accountManagerName,
                                      title: 'Account Manager',
                                      icon: Icons.person,
                                    ),
                                    IconTextCombo(
                                      data: nv.format(
                                        int.parse(
                                            saleForcast.valueOfTheProject),
                                      ),
                                      title: 'Value of the Project',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      tablet: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: saleForcast.projectName,
                                title: 'Project Name',
                                icon: Icons.work_outline_sharp,
                              ),
                              IconTextCombo(
                                data: saleForcast.nameOfTheAccount,
                                title: 'Name of the Account',
                                icon: Icons.account_balance,
                              ),
                              IconTextCombo(
                                data: saleForcast
                                        .probabilityOfClosing.capitalize! +
                                    (saleForcast.probabilityOfClosing ==
                                            'No Data'
                                        ? ''
                                        : ' %'),
                                title: 'Probability of Clossing',
                                icon: Icons.confirmation_number_outlined,
                              ),
                              IconTextCombo(
                                data: saleForcast.accountManagerName,
                                title: 'Account Manager',
                                icon: Icons.person,
                              ),
                              IconTextCombo(
                                data: nv.format(
                                  int.parse(saleForcast.valueOfTheProject),
                                ),
                                title: 'Value of the Project',
                                icon: Icons.attach_money_outlined,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      child: Text(
                        'Project Dates',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconTextCombo(
                                      data: saleForcast.poDate,
                                      title: 'PO Date',
                                      icon: Icons.date_range,
                                    ),
                                    IconTextCombo(
                                      data: saleForcast.proposalSubmissionDate,
                                      title: 'Proposal Submission Date',
                                      icon: Icons.date_range,
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
                                      data: saleForcast.lastFollowUpDate,
                                      title: 'Last Follo-up Date',
                                      icon: Icons.date_range,
                                    ),
                                    IconTextCombo(
                                      data: saleForcast.expectedClosingDate,
                                      title: 'Expected Closing Date',
                                      icon: Icons.date_range,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      tablet: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: saleForcast.poDate,
                                title: 'PO Date',
                                icon: Icons.date_range,
                              ),
                              IconTextCombo(
                                data: saleForcast.proposalSubmissionDate,
                                title: 'Proposal Submission Date',
                                icon: Icons.date_range,
                              ),
                              IconTextCombo(
                                data: saleForcast.lastFollowUpDate,
                                title: 'Last Follo-up Date',
                                icon: Icons.date_range,
                              ),
                              IconTextCombo(
                                data: saleForcast.expectedClosingDate,
                                title: 'Expected Closing Date',
                                icon: Icons.date_range,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      child: Text(
                        'Contact Person Information',
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
                                      data: saleForcast.contactPerson,
                                      title: 'Contact Person',
                                      icon: Icons.work_outline_sharp,
                                    ),
                                    IconTextCombo(
                                      data: saleForcast.contactPersonMobile,
                                      title: 'Contact Mobile',
                                      icon: Icons.phone_android_rounded,
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
                                      data: saleForcast.contactPersonEmail,
                                      title: 'Contact Email',
                                      icon: Icons.person,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      tablet: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: saleForcast.contactPerson,
                                title: 'Contact Person',
                                icon: Icons.work_outline_sharp,
                              ),
                              IconTextCombo(
                                data: saleForcast.contactPersonMobile,
                                title: 'Contact Mobile',
                                icon: Icons.phone_android_rounded,
                              ),
                              IconTextCombo(
                                data: saleForcast.contactPersonEmail,
                                title: 'Contact Email',
                                icon: Icons.person,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      child: Text(
                        'Project Updates',
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
                            children: [
                              IconTextCombo(
                                data: saleForcast.activityUpdate,
                                title: 'Activity Update',
                                icon: Icons.comment,
                              ),
                              IconTextCombo(
                                data: saleForcast.remarks,
                                title: 'Remark',
                                icon: Icons.comment,
                              ),
                            ],
                          ),
                        ),
                      ),
                      tablet: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconTextCombo(
                                data: saleForcast.activityUpdate,
                                title: 'Activity Update',
                                icon: Icons.comment,
                              ),
                              IconTextCombo(
                                data: saleForcast.remarks,
                                title: 'Remark',
                                icon: Icons.comment,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sffController.canEditAndDelete(saleForcast)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ResponsiveUI(
                              desktop: ElevatedButton.icon(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.SALESFORCASTEDIT,
                                    arguments: {
                                      'saleF': saleForcast,
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: ADNColorConstants.kADNWhite,
                                ),
                                label: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: ADNColorConstants.kADNWhite,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) =>
                                        ADNColorConstants.kADNLightGreen,
                                  ),
                                ),
                              ),
                              phoneL: IconButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.SALESFORCASTEDIT,
                                    arguments: {
                                      'saleF': saleForcast,
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: ADNColorConstants.kADNGreen,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ResponsiveUI(
                              desktop: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Warning!!!'),
                                        actions: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              sffController.deleteSaleForcast(
                                                  saleForcast);
                                            },
                                            icon: const Icon(
                                              Icons.edit_outlined,
                                              color:
                                                  ADNColorConstants.kADNWhite,
                                            ),
                                            label: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color: ADNColorConstants
                                                      .kADNWhite,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith(
                                                (states) => Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: ADNColorConstants.kADNWhite,
                                ),
                                label: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: ADNColorConstants.kADNWhite,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                    (states) => Colors.redAccent,
                                  ),
                                ),
                              ),
                              phoneL: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Warning!!!'),
                                        actions: [
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              sffController.deleteSaleForcast(
                                                  saleForcast);
                                            },
                                            icon: const Icon(
                                              Icons.edit_outlined,
                                              color:
                                                  ADNColorConstants.kADNWhite,
                                            ),
                                            label: const Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                  color: ADNColorConstants
                                                      .kADNWhite,
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith(
                                                (states) => Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      width: 10.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
