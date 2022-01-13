class PrItem {
  PrItem({
    required this.id,
    required this.purchaseType,
    required this.itemDescription,
    required this.itemQuantity,
    required this.measurementOfUnit,
    required this.requiredDate,
    required this.estimatedUnitPrice,
    required this.estimatedTotalPrice,
  });

  final String id;
  final String purchaseType;
  final String itemDescription;
  final int itemQuantity;
  final String measurementOfUnit;
  final String requiredDate;
  final int estimatedUnitPrice;
  final int estimatedTotalPrice;

  factory PrItem.fromJson(Map<String, dynamic> json) => PrItem(
        id: json["id"],
        purchaseType: json["attributes"]["purchase_type"],
        itemDescription: json["attributes"]["item_description"],
        itemQuantity: json["attributes"]["item_quantity"],
        measurementOfUnit:
            json["attributes"]["measurement_of_unit"] ?? 'No Data',
        requiredDate: json["attributes"]["required_date"] ?? 'No Data',
        estimatedUnitPrice: json["attributes"]["estimated_unit_price"],
        estimatedTotalPrice: json["attributes"]["estimated_total_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "purchase_type": purchaseType,
        "item_description": itemDescription,
        "item_quantity": itemQuantity,
        "measurement_of_unit":
            measurementOfUnit == 'No Data' ? null : measurementOfUnit,
        "required_date": requiredDate == 'No Data' ? null : requiredDate,
        "estimated_unit_price": estimatedUnitPrice,
        "estimated_total_price": estimatedTotalPrice,
      };

  @override
  String toString() {
    return """
    "id": $id,
    "purchase_type": $purchaseType,
    "item_description": $itemDescription,
    "item_quantity": $itemQuantity,
    "measurement_of_unit":
        $measurementOfUnit,
    "required_date": $requiredDate,
    "estimated_unit_price": $estimatedUnitPrice,
    "estimated_total_price": $estimatedTotalPrice,
    """;
  }
}
