import 'dart:convert';

import 'user_summary.dart';
import 'approval_request.dart';

Conveyance conveyanceFromJson(String str) =>
    Conveyance.fromJson(json.decode(str));

String conveyanceToJson(Conveyance data) => json.encode(data.toJson());

class Conveyance {
  Conveyance({
    required this.id,
    required this.applicant,
    required this.applicationDate,
    required this.conveyanceType,
    required this.inTime,
    required this.outTime,
    required this.from,
    required this.to,
    required this.payableAmount,
    required this.details,
    required this.approvals,
    required this.status,
  });

  final String id;
  final UserSummary applicant;
  final String applicationDate;
  final String conveyanceType;
  final String inTime;
  final String outTime;
  final String from;
  final String to;
  final int payableAmount;
  final String details;
  final List<ApprovalRequest> approvals;
  final String status;

  factory Conveyance.fromJson(Map<String, dynamic> json) => Conveyance(
        id: json["id"],
        applicant: UserSummary.fromJson(json["attributes"]["applicant"]),
        applicationDate: json["attributes"]["application_date"],
        conveyanceType: json["attributes"]["conveyance_type"],
        inTime: json["attributes"]["in_time"],
        outTime: json["attributes"]["out_time"],
        from: json["attributes"]["from"] ?? 'No Data',
        to: json["attributes"]["to"] ?? 'No Data',
        payableAmount: json["attributes"]["payable_amount"],
        details: json["attributes"]["details"] ?? 'No Data',
        status: json["attributes"]["status"] ?? 'No Data',
        approvals: List<ApprovalRequest>.from(
          json["attributes"]["approvals"].map(
            (x) => ApprovalRequest.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicant": applicant.toJson(),
        "application_date": applicationDate,
        "conveyance_type": conveyanceType,
        "in_time": inTime,
        "out_time": outTime,
        "from": from == 'No Data' ? null : from,
        "to": to == 'No Data' ? null : to,
        "payable_amount": payableAmount,
        "details": details == 'No Data' ? null : details,
        "approvals": List<dynamic>.from(approvals.map((x) => x.toJson())),
        "status": status == 'No Data' ? null : status,
      };

  getDateTimeString(String dt) {
    return "${DateTime.parse(dt).day}-${DateTime.parse(dt).month}-${DateTime.parse(dt).year} ${DateTime.parse(dt).hour}:${DateTime.parse(dt).minute}:00";
  }
}
