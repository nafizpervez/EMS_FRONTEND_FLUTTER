import 'dart:convert';

AllotedLeaveDetail allotedLeaveDetailFromJson(String str) =>
    AllotedLeaveDetail.fromJson(json.decode(str));

String allotedLeaveDetailToJson(AllotedLeaveDetail data) =>
    json.encode(data.toJson());

class AllotedLeaveDetail {
  AllotedLeaveDetail({
    required this.id,
    required this.totalAllotedLeaves,
    required this.sickLeave,
    required this.annualLeave,
    required this.maternityLeave,
    required this.unpaidLeave,
    required this.enjoyedTotalLeaveCount,
    required this.remainingLeaveCount,
    required this.businessYearStart,
    required this.businessYearEnd,
  });

  final String id;
  final int totalAllotedLeaves;
  final int sickLeave;
  final int annualLeave;
  final int maternityLeave;
  final int unpaidLeave;
  final int enjoyedTotalLeaveCount;
  final int remainingLeaveCount;
  final String businessYearStart;
  final String businessYearEnd;

  factory AllotedLeaveDetail.fromJson(Map<String, dynamic> json) =>
      AllotedLeaveDetail(
        id: json["id"],
        totalAllotedLeaves: json["attributes"]["total_alloted_leaves"],
        sickLeave: json["attributes"]["sick_leave"],
        annualLeave: json["attributes"]["annual_leave"],
        maternityLeave: json["attributes"]["maternity_leave"],
        unpaidLeave: json["attributes"]["unpaid_leave"],
        enjoyedTotalLeaveCount: json["attributes"]["enjoyed_total_leave_count"],
        remainingLeaveCount: json["attributes"]["remaining_leave_count"],
        businessYearStart: json["attributes"]["business_year_start"],
        businessYearEnd: json["attributes"]["business_year_end"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_alloted_leaves": totalAllotedLeaves,
        "sick_leave": sickLeave,
        "annual_leave": annualLeave,
        "maternity_leave": maternityLeave,
        "unpaid_leave": unpaidLeave,
        "enjoyed_total_leave_count": enjoyedTotalLeaveCount,
        "remaining_leave_count": remainingLeaveCount,
        "business_year_start": businessYearStart,
        "business_year_end": businessYearEnd,
      };
}
