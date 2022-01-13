import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/sale_forcast.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'sale_forcast_details_popup.dart';

class PersonalFunnel extends StatelessWidget {
  final List<SaleForcast> forcasts;
  const PersonalFunnel({Key? key, required this.forcasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _vsc = ScrollController(debugLabel: 'saleForScroll');
    return ResponsiveUI(
      desktop: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  'SL',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
              ...[
                'Project Name',
                'Name of the Account',
                'Value of the Project',
                'Expected Closing Date',
                'Possibility of Closing',
              ]
                  .map(
                    (dt) => Expanded(
                      flex: 3,
                      child: Text(
                        dt,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  )
                  .toList(),
              const Expanded(
                flex: 1,
                child: Text(
                  'View Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView(
              controller: _vsc,
              children: forcasts.map(
                (sfdata) {
                  final nv = NumberFormat.simpleCurrency(name: 'BDT');
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            (forcasts.indexOf(sfdata) + 1).toString(),
                          ),
                        ),
                        ...[
                          sfdata.projectName.capitalize,
                          sfdata.nameOfTheAccount.capitalize,
                          nv.format(
                            int.parse(sfdata.valueOfTheProject),
                          ),
                          sfdata.expectedClosingDate.capitalize,
                          sfdata.probabilityOfClosing.capitalize! +
                              (sfdata.probabilityOfClosing == 'No Data'
                                  ? ''
                                  : ' %'),
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
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              Get.dialog(
                                SaleForcastDetailsPopUp(
                                  saleForcast: sfdata,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.description_outlined,
                              color: ADNColorConstants.kADNLightGreen,
                            ),
                            tooltip: 'View Details',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
      phoneL: ListView(
        controller: _vsc,
        children: forcasts.map(
          (sfdata) {
            return Card(
              elevation: 3,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextCombo(
                          data: sfdata.projectName,
                          title: 'Project Name',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: sfdata.nameOfTheAccount,
                          title: 'Account Name',
                          icon: Icons.design_services_sharp,
                        ),
                        IconTextCombo(
                          data: sfdata.valueOfTheProject,
                          title: 'Project Value',
                          icon: Icons.email_outlined,
                        ),
                        IconTextCombo(
                          data: sfdata.probabilityOfClosing + ' %',
                          title: 'Closing Probability',
                          icon: Icons.phone_enabled_outlined,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 2.0,
                    right: 2.0,
                    child: IconButton(
                      onPressed: () {
                        Get.dialog(
                          SaleForcastDetailsPopUp(
                            saleForcast: sfdata,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.description_outlined,
                        color: ADNColorConstants.kADNLightGreen,
                      ),
                      tooltip: 'Veiw Detail',
                    ),
                  )
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
