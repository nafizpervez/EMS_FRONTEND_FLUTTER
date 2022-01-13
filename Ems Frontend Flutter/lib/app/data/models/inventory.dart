import 'dart:convert';

import 'package:intl/intl.dart';

import 'attachment.dart';
import 'user_summary.dart';

Inventory inventoryFromJson(String str) => Inventory.fromJson(json.decode(str));

String inventoryToJson(Inventory data) => json.encode(data.toJson());

class Inventory {
  Inventory({
    required this.id,
    required this.addedBy,
    required this.productCategory,
    required this.productName,
    required this.productParticulars,
    required this.clientName,
    required this.perUnitPrice,
    required this.latestStock,
    required this.latestStockDate,
    required this.physicallyFoundQuantity,
    required this.salesQuantity,
    required this.purchaseQuantity,
    required this.stockQuantityToBeReported,
    required this.excessQuantity,
    required this.shortageQuantity,
    required this.remarks,
    required this.productImage,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final UserSummary addedBy;
  final String productCategory;
  final String productName;
  final String productParticulars;
  final String clientName;
  final int perUnitPrice;
  final int latestStock;
  final DateTime latestStockDate;
  final int physicallyFoundQuantity;
  final int salesQuantity;
  final int purchaseQuantity;
  final int stockQuantityToBeReported;
  final int excessQuantity;
  final int shortageQuantity;
  final dynamic remarks;
  final Attachment? productImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        addedBy: UserSummary.fromJson(
          json["attributes"]["added_by"],
        ),
        productCategory: json["attributes"]["product_category"],
        productName: json["attributes"]["product_name"],
        productParticulars: json["attributes"]["product_particulars"],
        clientName: json["attributes"]["client_name"] ?? 'No Data',
        perUnitPrice: json["attributes"]["per_unit_price"],
        latestStock: json["attributes"]["latest_stock"],
        latestStockDate:
            DateTime.parse(json["attributes"]["latest_stock_date"]),
        physicallyFoundQuantity: json["attributes"]
            ["physically_found_quantity"],
        salesQuantity: json["attributes"]["sales_quantity"],
        purchaseQuantity: json["attributes"]["purchase_quantity"],
        stockQuantityToBeReported: json["attributes"]
            ["stock_quantity_to_be_reported"],
        excessQuantity: json["attributes"]["excess_quantity"],
        shortageQuantity: json["attributes"]["shortage_quantity"],
        remarks: json["attributes"]["remarks"] ?? 'No Data',
        productImage: json["attributes"]["product_image"] == null
            ? null
            : Attachment.fromJson(
                json["attributes"]["product_image"],
              ),
        createdAt: DateTime.parse(json["attributes"]["created_at"]),
        updatedAt: DateTime.parse(json["attributes"]["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy.toJson(),
        "product_category": productCategory,
        "product_name": productName,
        "product_particulars": productParticulars,
        "client_name": clientName == 'No Data' ? null : clientName.toString(),
        "per_unit_price": perUnitPrice,
        "latest_stock": latestStock,
        "latest_stock_date":
            "${latestStockDate.year.toString().padLeft(4, '0')}-${latestStockDate.month.toString().padLeft(2, '0')}-${latestStockDate.day.toString().padLeft(2, '0')}",
        "physically_found_quantity": physicallyFoundQuantity,
        "sales_quantity": salesQuantity,
        "purchase_quantity": purchaseQuantity,
        "stock_quantity_to_be_reported": stockQuantityToBeReported,
        "excess_quantity": excessQuantity,
        "shortage_quantity": shortageQuantity,
        "remarks": remarks == 'No Data' ? null : remarks.toString(),
        "product_image": productImage == null ? null : productImage!.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  String stockDate() {
    return '${latestStockDate.day}-${latestStockDate.month}-${latestStockDate.year}';
  }

  String getPerUnitPrice() {
    if (perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        perUnitPrice,
      );
    }
  }

  String totalPrice() {
    if (perUnitPrice == 0 || latestStock == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        latestStock * perUnitPrice,
      );
    }
  }

  String physicallyFoundValue() {
    if (physicallyFoundQuantity == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        physicallyFoundQuantity * perUnitPrice,
      );
    }
  }

  String salesValue() {
    if (salesQuantity == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        salesQuantity * perUnitPrice,
      );
    }
  }

  String purchaseValue() {
    if (purchaseQuantity == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        purchaseQuantity * perUnitPrice,
      );
    }
  }

  String stockValueToBeReported() {
    if (stockQuantityToBeReported == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        stockQuantityToBeReported * perUnitPrice,
      );
    }
  }

  String excessValue() {
    if (excessQuantity == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        excessQuantity * perUnitPrice,
      );
    }
  }

  String shortageValue() {
    if (shortageQuantity == 0 || perUnitPrice == 0) {
      return 'Missing Data';
    } else {
      return NumberFormat.simpleCurrency(name: 'BDT').format(
        shortageQuantity * perUnitPrice,
      );
    }
  }

  String getPhysicallyFoundQuantity() {
    if (physicallyFoundQuantity == 0) {
      return 'Missing Data';
    } else {
      return physicallyFoundQuantity.toString();
    }
  }

  String getSalesQuantity() {
    if (salesQuantity == 0) {
      return 'Missing Data';
    } else {
      return salesQuantity.toString();
    }
  }

  String getPurchaseQuantity() {
    if (purchaseQuantity == 0) {
      return 'Missing Data';
    } else {
      return purchaseQuantity.toString();
    }
  }

  String getStockQuantityToBeReported() {
    if (stockQuantityToBeReported == 0) {
      return 'Missing Data';
    } else {
      return stockQuantityToBeReported.toString();
    }
  }

  String getExcessQuantity() {
    if (excessQuantity == 0) {
      return 'Missing Data';
    } else {
      return excessQuantity.toString();
    }
  }

  String getShortageQuantity() {
    if (shortageQuantity == 0) {
      return 'Missing Data';
    } else {
      return shortageQuantity.toString();
    }
  }
}
