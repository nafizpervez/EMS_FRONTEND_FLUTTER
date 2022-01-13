import 'dart:convert';

import 'package:adnems/app/data/models/user_summary.dart';

ApprovalRequest approvalRequestFromJson(String str) =>
    ApprovalRequest.fromJson(json.decode(str));

String approvalRequestToJson(ApprovalRequest data) =>
    json.encode(data.toJson());

class ApprovalRequest {
  ApprovalRequest({
    required this.id,
    required this.needApprovalFrom,
    required this.status,
    required this.canApprove,
    required this.line,
    required this.remark,
  });

  final String id;
  final UserSummary needApprovalFrom;
  final String status;
  final bool canApprove;
  final int line;
  final String remark;

  factory ApprovalRequest.fromJson(Map<String, dynamic> json) =>
      ApprovalRequest(
        id: json["id"],
        needApprovalFrom: UserSummary.fromJson(
          json["attributes"]["need_approval_from"],
        ),
        status: json["attributes"]["status"],
        canApprove: json["attributes"]["can_approve"] ?? false,
        line: json["attributes"]["line"],
        remark: json["attributes"]["remark"] ?? 'No Data',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "need_approval_from": needApprovalFrom.toJson(),
        "status": status,
        "can_approve": canApprove,
        "line": line,
        "remark": remark == 'No Data' || remark == 'null' ? null : remark,
      };
}
