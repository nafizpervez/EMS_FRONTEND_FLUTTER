import 'dart:convert';

UserSummary userSummaryFromJson(String str) =>
    UserSummary.fromJson(json.decode(str));

String userSummaryToJson(UserSummary data) => json.encode(data.toJson());

class UserSummary {
  UserSummary({
    required this.id,
    required this.name,
    required this.employeeId,
    required this.designation,
    required this.division,
    required this.department,
    required this.grade,
  });

  final String id;
  final String name;
  final String employeeId;
  final String designation;
  final String division;
  final String department;
  final String grade;

  factory UserSummary.fromJson(Map<String, dynamic> json) => UserSummary(
        id: json["id"],
        name: json["attributes"]["name"] ?? 'No Data',
        employeeId: json["attributes"]["employee_id"] ?? 'No Data',
        designation: json["attributes"]["designation"] ?? 'No Data',
        division: json["attributes"]["division"] ?? 'No Data',
        department: json["attributes"]["department"] ?? 'No Data',
        grade: json["attributes"]["grade"] ?? 'No Data',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == 'No Data' ? null : name,
        "employee_id": employeeId == 'No Data' ? null : employeeId,
        "designation": designation == 'No Data' ? null : designation,
        "division": division == 'No Data' ? null : division,
        "department": department == 'No Data' ? null : department,
        "grade": grade == 'No Data' ? null : grade,
      };
}
