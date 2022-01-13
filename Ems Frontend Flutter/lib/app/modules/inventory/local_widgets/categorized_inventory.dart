import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/inventory.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'inventory_details_popup.dart';

class CategorizedInventory extends StatelessWidget {
  final List<Inventory> inventories;
  const CategorizedInventory({
    Key? key,
    required this.inventories,
  }) : super(key: key);

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
                'Product Name',
                'Client Name',
                'Stock Quantity',
                'Per Unit Price',
                'Total Price',
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
              children: inventories.map(
                (invData) {
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
                            (inventories.indexOf(invData) + 1).toString(),
                          ),
                        ),
                        ...[
                          invData.productName.capitalize,
                          invData.clientName.capitalize,
                          invData.stockQuantityToBeReported.toString(),
                          invData.getPerUnitPrice(),
                          invData.totalPrice(),
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
                                InventoryDetailsPopUp(
                                  inventory: invData,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.description_sharp,
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
        children: inventories.map(
          (invData) {
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
                          data: invData.productName,
                          title: 'Product Name',
                          icon: Icons.person,
                        ),
                        IconTextCombo(
                          data: invData.clientName,
                          title: 'Client Name',
                          icon: Icons.design_services_sharp,
                        ),
                        IconTextCombo(
                          data: invData.stockQuantityToBeReported.toString(),
                          title: 'Total Quantity',
                          icon: Icons.email_outlined,
                        ),
                        IconTextCombo(
                          data: invData.totalPrice(),
                          title: 'Total Value',
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
                          InventoryDetailsPopUp(
                            inventory: invData,
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
