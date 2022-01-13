import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/data/models/inventory.dart';
import 'package:adnems/app/global/widgets/icon_text_combo.dart';
import 'package:adnems/app/global/widgets/responsive_ui.dart';
import 'package:adnems/app/modules/inventory/inventory_controller.dart';
import 'package:adnems/app/routes/app_pages.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryDetailsPopUp extends StatelessWidget {
  final Inventory inventory;
  const InventoryDetailsPopUp({
    Key? key,
    required this.inventory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _lvDController =
        ScrollController(debugLabel: 'InvDetailScroll');
    final InventoryController invtController = Get.find<InventoryController>();
    return FadeInDown(
      duration: const Duration(milliseconds: 300),
      child: AlertDialog(
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: _lvDController,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                      child: Text(
                        'Product Information',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    inventory.productImage == null
                        ? const SizedBox(
                            width: 10.0,
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 100.0,
                            child: ClipOval(
                              child: Image.network(
                                inventory.productImage!.attachmentUrl,
                                fit: BoxFit.cover,
                                width: 200.0,
                                height: 200.0,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.inventory,
                                    size: 50.0,
                                  );
                                },
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
                                      data: inventory.productName,
                                      title: 'Product Name',
                                      icon: Icons.smart_toy_sharp,
                                    ),
                                    IconTextCombo(
                                      data: inventory.productCategory,
                                      title: 'Product Category',
                                      icon: Icons.category,
                                    ),
                                    IconTextCombo(
                                      data: inventory.productParticulars,
                                      title: 'Product Particulars',
                                      icon: Icons.description,
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
                                      data: inventory.clientName,
                                      title: 'Client Name',
                                      icon: Icons.person,
                                    ),
                                    IconTextCombo(
                                      data: inventory.getPerUnitPrice(),
                                      title: 'Per Unit Price',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.latestStock.toString() +
                                          ' as of ${inventory.stockDate()}',
                                      title: 'Latest Stock',
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
                                data: inventory.productName,
                                title: 'Product Name',
                                icon: Icons.smart_toy_sharp,
                              ),
                              IconTextCombo(
                                data: inventory.productCategory,
                                title: 'Product Category',
                                icon: Icons.category,
                              ),
                              IconTextCombo(
                                data: inventory.productParticulars,
                                title: 'Product Particulars',
                                icon: Icons.description,
                              ),
                              IconTextCombo(
                                data: inventory.clientName,
                                title: 'Client Name',
                                icon: Icons.person,
                              ),
                              IconTextCombo(
                                data: inventory.getPerUnitPrice(),
                                title: 'Per Unit Price',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.latestStock.toString() +
                                    ' as of ${inventory.stockDate()}',
                                title: 'Latest Stock',
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
                        'Product Stock Information',
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
                                      data: inventory
                                          .getPhysicallyFoundQuantity(),
                                      title: 'Physically Found Quantity',
                                      icon: Icons.local_play_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.getSalesQuantity(),
                                      title: 'Sales Quantity',
                                      icon: Icons.local_play_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.getPurchaseQuantity(),
                                      title: 'Purchase Quantity',
                                      icon: Icons.local_play_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory
                                          .getStockQuantityToBeReported(),
                                      title: 'Stock Quantity to be Reported',
                                      icon: Icons.local_play_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.getExcessQuantity(),
                                      title: 'Excess Quantity',
                                      icon: Icons.local_play_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.getShortageQuantity(),
                                      title: 'Shortage Quantity',
                                      icon: Icons.local_play_outlined,
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
                                      data: inventory.physicallyFoundValue(),
                                      title: 'Physically Found Value',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.salesValue(),
                                      title: 'Sales Value',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.purchaseValue(),
                                      title: 'Purchase Value',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.stockValueToBeReported(),
                                      title: 'Stock Value to be Reported',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.excessValue(),
                                      title: 'Excess Value',
                                      icon: Icons.attach_money_outlined,
                                    ),
                                    IconTextCombo(
                                      data: inventory.shortageValue(),
                                      title: 'Shortage Value',
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
                                data: inventory.getPhysicallyFoundQuantity(),
                                title: 'Physically Found Quantity',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.getSalesQuantity(),
                                title: 'Sales Quantity',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.getPurchaseQuantity(),
                                title: 'Purchase Quantity',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.getStockQuantityToBeReported(),
                                title: 'Stock Quantity to be Reported',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.getExcessQuantity(),
                                title: 'Excess Quantity',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.getShortageQuantity(),
                                title: 'Shortage Quantity',
                                icon: Icons.local_play_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.physicallyFoundValue(),
                                title: 'Physically Found Value',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.salesValue(),
                                title: 'Sales Value',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.purchaseValue(),
                                title: 'Purchase Value',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.stockValueToBeReported(),
                                title: 'Stock Value to be Reported',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.excessValue(),
                                title: 'Excess Value',
                                icon: Icons.attach_money_outlined,
                              ),
                              IconTextCombo(
                                data: inventory.shortageValue(),
                                title: 'Shortage Value',
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
                        'Product Updates',
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
                                data: inventory.remarks,
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
                                data: inventory.remarks,
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
              invtController.canEditAndDelete()
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
                                    Routes.INVENTORYEDIT,
                                    arguments: {
                                      'inventory': inventory,
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
                                      'inventory': inventory,
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
                                              invtController.deleteInventory(
                                                inventory,
                                              );
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
                                              invtController.deleteInventory(
                                                inventory,
                                              );
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
