import 'package:accordion/accordion.dart';
import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/inventory/inventory_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categorized_inventory.dart';

class InventorIndex extends StatefulWidget {
  const InventorIndex({Key? key}) : super(key: key);

  @override
  State<InventorIndex> createState() => _InventorIndexState();
}

class _InventorIndexState extends State<InventorIndex> {
  final ScrollController _vsc =
      ScrollController(debugLabel: 'inventoriesScroll');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: GetX<InventoryController>(
        builder: (inventoryController) {
          return inventoryController.stockLoaded
              ? inventoryController.inventories.isEmpty
                  ? const Center(
                      child: Text(
                        'No Funnel Record Found!',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ResponsiveUI(
                      desktop: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inventoryController.canEditAndDelete()
                              ? ElevatedButton.icon(
                                  onPressed: () {
                                    Get.toNamed(
                                      Routes.INVENTORYCREATE,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: ADNColorConstants.kADNWhite,
                                  ),
                                  label: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Add New',
                                      style: TextStyle(
                                        color: ADNColorConstants.kADNWhite,
                                        fontSize: 18.0,
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
                                )
                              : const SizedBox(
                                  width: 10.0,
                                ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            child: Accordion(
                              headerBackgroundColor:
                                  ADNColorConstants.kADNGreen,
                              maxOpenSections: 2,
                              headerPadding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 15),
                              children: inventoryController
                                  .getGroups()
                                  .entries
                                  .map(
                                    (inventoryGroup) => AccordionSection(
                                      isOpen: true,
                                      leftIcon: const Icon(
                                        Icons.inventory,
                                        color: Colors.white,
                                      ),
                                      header: Text(
                                        inventoryGroup.key,
                                        style: const TextStyle(
                                            color: ADNColorConstants.kADNWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.30,
                                          child: CategorizedInventory(
                                            inventories: inventoryGroup.value,
                                          ),
                                        ),
                                      ),
                                      contentHorizontalPadding: 0,
                                      contentBorderWidth: 0,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      phoneL: Stack(
                        children: [
                          Accordion(
                            headerBackgroundColor: ADNColorConstants.kADNGreen,
                            maxOpenSections: 1,
                            headerPadding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            children: inventoryController
                                .getGroups()
                                .entries
                                .map(
                                  (inventoryGroup) => AccordionSection(
                                    isOpen: true,
                                    leftIcon: const Icon(
                                      Icons.inventory,
                                      color: Colors.white,
                                    ),
                                    header: Text(
                                      inventoryGroup.key,
                                      style: const TextStyle(
                                          color: ADNColorConstants.kADNWhite,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.70,
                                        child: CategorizedInventory(
                                          inventories: inventoryGroup.value,
                                        ),
                                      ),
                                    ),
                                    contentHorizontalPadding: 0,
                                    contentBorderWidth: 0,
                                  ),
                                )
                                .toList(),
                          ),
                          Positioned(
                            bottom: 10.0,
                            right: 10.0,
                            child: inventoryController.canEditAndDelete()
                                ? Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          ADNColorConstants.kADNGreen,
                                          ADNColorConstants.kADNLightGreen,
                                        ],
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          Routes.INVENTORYCREATE,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: ADNColorConstants.kADNWhite,
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    width: 10.0,
                                  ),
                          ),
                        ],
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(
                    color: ADNColorConstants.kADNLightGreen,
                  ),
                );
        },
      ),
    );
  }
}
