import 'dart:convert';

import 'package:adnems/app/data/models/approval_request.dart';
import 'package:adnems/app/data/models/attachment.dart';
import 'package:adnems/app/data/models/user_summary.dart';

Leave leaveFromJson(String str) => Leave.fromJson(json.decode(str));

String leaveToJson(Leave data) => json.encode(data.toJson());

class Leave {
  Leave({
    required this.id,
    required this.applicant,
    required this.applicationDate,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.details,
    required this.emergencyContactPerson,
    required this.emergencyContactNumber,
    required this.emergencyContactAddress,
    required this.status,
    required this.approvals,
    required this.attachments,
  });

  final String id;
  final String applicationDate;
  final UserSummary applicant;
  final String leaveType;
  final String startDate;
  final String endDate;
  final int totalDays;
  final String details;
  final String emergencyContactPerson;
  final String emergencyContactNumber;
  final String emergencyContactAddress;
  final String status;
  final List<ApprovalRequest> approvals;
  final List<Attachment> attachments;

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        id: json["id"],
        applicant: UserSummary.fromJson(
          json["attributes"]["applicant"],
        ),
        applicationDate: json["attributes"]["application_date"],
        leaveType: json["attributes"]["leave_type"],
        startDate: json["attributes"]["start_date"],
        endDate: json["attributes"]["end_date"],
        totalDays: json["attributes"]["total_days"],
        details: json["attributes"]["details"] ?? 'No Data',
        emergencyContactPerson:
            json["attributes"]["emergency_contact_person"] ?? 'No Data',
        emergencyContactNumber:
            json["attributes"]["emergency_contact_number"] ?? 'No Data',
        emergencyContactAddress:
            json["attributes"]["emergency_contact_address"] ?? 'No Data',
        status: json["attributes"]["status"] ?? 'No Data',
        approvals: List<ApprovalRequest>.from(
          json["attributes"]["approvals"].map(
            (approval) => ApprovalRequest.fromJson(approval),
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
        "leave_type": leaveType,
        "start_date": startDate,
        "end_date": endDate,
        "total_days": totalDays,
        "details": details == 'No Data' ? null : details,
        "emergency_contact_person":
            emergencyContactPerson == 'No Data' ? null : emergencyContactPerson,
        "emergency_contact_number":
            emergencyContactNumber == 'No Data' ? null : emergencyContactNumber,
        "emergency_contact_address": emergencyContactAddress == 'No Data'
            ? null
            : emergencyContactAddress,
        "status": status == 'No Data' ? null : status,
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
