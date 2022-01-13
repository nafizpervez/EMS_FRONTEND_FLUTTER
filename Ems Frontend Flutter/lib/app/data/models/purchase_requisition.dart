import 'dart:convert';

import 'approval_request.dart';
import 'attachment.dart';
import 'pr_item.dart';
import 'user_summary.dart';

PurchaseRequisition purchaseRequisitionFromJson(String str) =>
    PurchaseRequisition.fromJson(json.decode(str));

String purchaseRequisitionToJson(PurchaseRequisition data) =>
    json.encode(data.toJson());

class PurchaseRequisition {
  PurchaseRequisition({
    required this.id,
    required this.applicant,
    required this.applicationDate,
    required this.serialId,
    required this.expanseType,
    required this.user,
    required this.purposeOfPurchase,
    required this.comment,
    required this.status,
    required this.prItems,
    required this.approvals,
    required this.attachments,
  });

  final String id;
  final UserSummary applicant;
  final String serialId;
  final String applicationDate;
  final String expanseType;
  final String user;
  final String purposeOfPurchase;
  final String comment;
  final String status;
  final List<PrItem> prItems;
  final List<ApprovalRequest> approvals;
  final List<Attachment> attachments;

  factory PurchaseRequisition.fromJson(Map<String, dynamic> json) =>
      PurchaseRequisition(
        id: json["id"],
        applicant: UserSummary.fromJson(json["attributes"]["applicant"]),
        applicationDate: json["attributes"]["application_date"],
        serialId: json["attributes"]["serial_id"],
        expanseType: json["attributes"]["expanse_type"],
        purposeOfPurchase:
            json["attributes"]["purpose_of_purchase"] ?? 'No Data',
        user: json["attributes"]["user"],
        status: json["attributes"]["status"] ?? 'No Data',
        comment: json["attributes"]["comment"],
        prItems: List<PrItem>.from(
          json["attributes"]["pr_items"].map(
            (x) => PrItem.fromJson(x),
          ),
        ),
        approvals: List<ApprovalRequest>.from(
          json["attributes"]["approvals"].map(
            (x) => ApprovalRequest.fromJson(x),
          ),
        ),
        attachments: List<Attachment>.from(
          json["attributes"]["attachments"].map(
            (approval) => Attachment.fromJson(approval),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicant": applicant.toJson(),
        "application_date": applicationDate,
        "serial_id": serialId,
        "expanse_type": expanseType,
        "purpose_of_purchase":
            purposeOfPurchase == 'No Data' ? null : purposeOfPurchase,
        "user": user,
        "status": status == 'No Data' ? null : status,
        "comment": comment,
        "pr_items": List<dynamic>.from(
          prItems.map(
            (x) => x.toJson(),
          ),
        ),
        "approvals": List<dynamic>.from(
          approvals.map(
            (x) => x.toJson(),
          ),
        ),
        "attachments": List<dynamic>.from(
          attachments.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
