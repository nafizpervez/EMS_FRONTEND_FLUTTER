import 'dart:convert';

SaleForcast saleForcastFromJson(String str) =>
    SaleForcast.fromJson(json.decode(str));

String saleForcastToJson(SaleForcast data) => json.encode(data.toJson());

class SaleForcast {
  SaleForcast({
    required this.id,
    required this.nameOfTheAccount,
    required this.accountManagerName,
    required this.projectName,
    required this.contactPerson,
    required this.contactPersonMobile,
    required this.contactPersonEmail,
    required this.valueOfTheProject,
    required this.poDate,
    required this.proposalSubmissionDate,
    required this.lastFollowUpDate,
    required this.expectedClosingDate,
    required this.probabilityOfClosing,
    required this.remarks,
    required this.activityUpdate,
  });

  final String id;
  final String nameOfTheAccount;
  final String accountManagerName;
  final String projectName;
  final String contactPerson;
  final String contactPersonMobile;
  final String contactPersonEmail;
  final String valueOfTheProject;
  final String poDate;
  final String proposalSubmissionDate;
  final String lastFollowUpDate;
  final String expectedClosingDate;
  final String probabilityOfClosing;
  final String remarks;
  final String activityUpdate;

  SaleForcast copyWith({
    String? id,
    String? nameOfTheAccount,
    String? accountManagerName,
    String? projectName,
    String? contactPerson,
    String? contactPersonMobile,
    String? contactPersonEmail,
    String? valueOfTheProject,
    String? poDate,
    String? proposalSubmissionDate,
    String? lastFollowUpDate,
    String? expectedClosingDate,
    String? probabilityOfClosing,
    String? remarks,
    String? activityUpdate,
  }) =>
      SaleForcast(
        id: id ?? this.id,
        nameOfTheAccount: nameOfTheAccount ?? this.nameOfTheAccount,
        accountManagerName: accountManagerName ?? this.accountManagerName,
        projectName: projectName ?? this.projectName,
        contactPerson: contactPerson ?? this.contactPerson,
        contactPersonMobile: contactPersonMobile ?? this.contactPersonMobile,
        contactPersonEmail: contactPersonEmail ?? this.contactPersonEmail,
        valueOfTheProject: valueOfTheProject ?? this.valueOfTheProject,
        poDate: poDate ?? this.poDate,
        proposalSubmissionDate:
            proposalSubmissionDate ?? this.proposalSubmissionDate,
        lastFollowUpDate: lastFollowUpDate ?? this.lastFollowUpDate,
        expectedClosingDate: expectedClosingDate ?? this.expectedClosingDate,
        probabilityOfClosing: probabilityOfClosing ?? this.probabilityOfClosing,
        remarks: remarks ?? this.remarks,
        activityUpdate: activityUpdate ?? this.activityUpdate,
      );

  factory SaleForcast.fromJson(Map<String, dynamic> json) => SaleForcast(
        id: json["id"],
        nameOfTheAccount:
            json["attributes"]["name_of_the_account"] ?? 'No Data',
        accountManagerName:
            json["attributes"]["account_manager_name"] ?? 'No Data',
        projectName: json["attributes"]["project_name"] ?? 'No Data',
        contactPerson: json["attributes"]["contact_person"] ?? 'No Data',
        contactPersonMobile:
            json["attributes"]["contact_person_mobile"] ?? 'No Data',
        contactPersonEmail:
            json["attributes"]["contact_person_email"] ?? 'No Data',
        valueOfTheProject: json["attributes"]["value_of_the_project"] == null
            ? 'No Data'
            : json["attributes"]["value_of_the_project"].toString(),
        poDate: json["attributes"]["po_date"] ?? 'No Data',
        proposalSubmissionDate:
            json["attributes"]["proposal_submission_date"] ?? 'No Data',
        lastFollowUpDate:
            json["attributes"]["last_follow_up_date"] ?? 'No Data',
        expectedClosingDate:
            json["attributes"]["expected_closing_date"] ?? 'No Data',
        probabilityOfClosing:
            json["attributes"]["probability_of_closing"] == null
                ? 'No Data'
                : json["attributes"]["probability_of_closing"].toString(),
        remarks: json["attributes"]["remarks"] ?? 'No Data',
        activityUpdate: json["attributes"]["remarks"] ?? 'No Data',
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "name_of_the_account":
            nameOfTheAccount == 'No Data' ? null : nameOfTheAccount.toString(),
        "account_manager_name": accountManagerName == 'No Data'
            ? null
            : accountManagerName.toString(),
        "project_name":
            projectName == 'No Data' ? null : projectName.toString(),
        "contact_person":
            contactPerson == 'No Data' ? null : contactPerson.toString(),
        "contact_person_mobile": contactPersonMobile == 'No Data'
            ? null
            : contactPersonMobile.toString(),
        "contact_person_email": contactPersonEmail == 'No Data'
            ? null
            : contactPersonEmail.toString(),
        "value_of_the_project": valueOfTheProject == 'No Data'
            ? null
            : valueOfTheProject.toString(),
        "po_date": poDate == 'No Data' ? null : poDate.toString(),
        "proposal_submission_date": proposalSubmissionDate == 'No Data'
            ? null
            : proposalSubmissionDate.toString(),
        "last_follow_up_date":
            lastFollowUpDate == 'No Data' ? null : lastFollowUpDate.toString(),
        "expected_closing_date": expectedClosingDate == 'No Data'
            ? null
            : expectedClosingDate.toString(),
        "probability_of_closing": probabilityOfClosing == 'No Data'
            ? null
            : probabilityOfClosing.toString(),
        "remarks": remarks == 'No Data' ? null : remarks.toString(),
        "activity_update":
            activityUpdate == 'No Data' ? null : activityUpdate.toString(),
      };
}

// import 'dart:convert';

// SaleForcast funnelInfoFromJson(String str) =>
//     SaleForcast.fromJson(json.decode(str));

// String funnelInfoToJson(SaleForcast data) => json.encode(data.toJson());

// class SaleForcast {
//   SaleForcast({
//     required this.id,
//     required this.nameOfTheAccount,
//     required this.accountManagerName,
//     required this.contactPerson,
//     required this.projectName,
//     required this.contactPersonMobile,
//     required this.contactPersonEmail,
//     required this.valueOfTheProject,
//     required this.poDate,
//     required this.proposalSubmissionDate,
//     required this.lastFollowUpDate,
//     required this.expectedClosingDate,
//     required this.probabilityOfClosing,
//     required this.activityUpdate,
//     required this.remarks,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final String? id;
//   final String? nameOfTheAccount;
//   final String? accountManagerName;
//   final String? contactPerson;
//   final String? projectName;
//   final String? contactPersonMobile;
//   final String? contactPersonEmail;
//   final int? valueOfTheProject;
//   final String? poDate;
//   final String? proposalSubmissionDate;
//   final String? lastFollowUpDate;
//   final String? expectedClosingDate;
//   final int? probabilityOfClosing;
//   final String? activityUpdate;
//   final String? remarks;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   factory SaleForcast.fromJson(Map<String, dynamic> json) => SaleForcast(
//         id: json["id"].toString(),
//         nameOfTheAccount:
//             json["attributes"]["name_of_the_account"] ?? 'No Data',
//         accountManagerName:
//             json["attributes"]["account_manager_name"] ?? 'No Data',
//         contactPerson: json["attributes"]["contact_person"] ?? 'No Data',
//         projectName: json["attributes"]["project_name"] ?? 'No Data',
//         contactPersonMobile:
//             json["attributes"]["contact_person_mobile"] ?? 'No Data',
//         contactPersonEmail:
//             json["attributes"]["contact_person_email"] ?? 'No Data',
//         valueOfTheProject: json["attributes"]["value_of_the_project"] ?? 0,
//         poDate: json["attributes"]["po_date"] ?? 'No Data',
//         proposalSubmissionDate:
//             json["attributes"]["proposal_submission_date"] ?? 'No Data',
//         lastFollowUpDate:
//             json["attributes"]["last_follow_up_date"] ?? 'No Data',
//         expectedClosingDate:
//             json["attributes"]["expected_closing_date"] ?? 'No Data',
//         probabilityOfClosing: json["attributes"]["probability_of_closing"] ?? 0,
//         activityUpdate: json["attributes"]["activity_update"] ?? 'No Data',
//         remarks: json["attributes"]["remarks"] ?? 'No Data',
//         createdAt:
//             DateTime.parse(json["attributes"]["created_at"] ?? '0000-00-00'),
//         updatedAt:
//             DateTime.parse(json["attributes"]["updated_at"] ?? '0000-00-00'),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name_of_the_account":
//             nameOfTheAccount == 'No Data' ? null : nameOfTheAccount,
//         "account_manager_name":
//             accountManagerName == 'No Data' ? null : accountManagerName,
//         "contact_person": contactPerson == 'No Data' ? null : contactPerson,
//         "project_name": projectName == 'No Data' ? null : projectName,
//         "contact_person_mobile":
//             contactPersonMobile == 'No Data' ? null : contactPersonMobile,
//         "contact_person_email":
//             contactPersonEmail == 'No Data' ? null : contactPersonEmail,
//         "value_of_the_project":
//             valueOfTheProject == 0 ? null : valueOfTheProject,
//         "po_date": poDate == 'No Data' ? null : poDate,
//         "proposal_submission_date":
//             proposalSubmissionDate == 'No Data' ? null : proposalSubmissionDate,
//         "last_follow_up_date":
//             lastFollowUpDate == 'No Data' ? null : lastFollowUpDate,
//         "expected_closing_date":
//             expectedClosingDate == 'No Data' ? null : expectedClosingDate,
//         "probability_of_closing":
//             probabilityOfClosing == 0 ? null : probabilityOfClosing,
//         "activity_update": activityUpdate == 'No Data' ? null : activityUpdate,
//         "remarks": remarks == 'No Data' ? null : remarks,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//       };
// }
