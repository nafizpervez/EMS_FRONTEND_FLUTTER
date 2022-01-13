import 'dart:convert';

import 'package:adnems/app/data/models/alloted_leave_detail.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.employeeId,
    required this.contactNumber,
    required this.email,
    required this.designation,
    required this.grade,
    required this.division,
    required this.department,
    required this.unit,
    required this.subUnit,
    required this.dateOfJoining,
    required this.location,
    required this.bloodGroup,
    required this.avater,
    required this.active,
    this.allotedLeaveDetail,
  });

  final String id;
  final String name;
  final String employeeId;
  final String contactNumber;
  final String email;
  final String designation;
  final String grade;
  final String division;
  final String department;
  final String unit;
  final String subUnit;
  final String dateOfJoining;
  final String location;
  final String bloodGroup;
  final String avater;
  final bool active;
  final AllotedLeaveDetail? allotedLeaveDetail;

  User copyWith({
    String? id,
    String? name,
    String? employeeId,
    String? contactNumber,
    String? email,
    String? designation,
    String? grade,
    String? division,
    String? department,
    String? unit,
    String? subUnit,
    String? dateOfJoining,
    String? location,
    String? bloodGroup,
    String? avater,
    bool? active,
    AllotedLeaveDetail? allotedLeaveDetail,
  }) =>
      User(
        id: id!,
        name: name!,
        employeeId: employeeId!,
        contactNumber: contactNumber!,
        email: email!,
        designation: designation!,
        grade: grade!,
        division: division!,
        department: department!,
        unit: unit!,
        subUnit: subUnit!,
        dateOfJoining: dateOfJoining!,
        location: location!,
        bloodGroup: bloodGroup!,
        avater: avater!,
        active: active!,
        allotedLeaveDetail: allotedLeaveDetail!,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["attributes"]["name"],
        employeeId: json["attributes"]["employee_id"],
        contactNumber: json["attributes"]["contact_number"] ?? 'No Data',
        email: json["attributes"]["email"] ?? 'No Data',
        designation: json["attributes"]["designation"] ?? 'No Data',
        grade: json["attributes"]["grade"] ?? 'No Data',
        division: json["attributes"]["division"] ?? 'No Data',
        department: json["attributes"]["department"] ?? 'No Data',
        unit: json["attributes"]["unit"] ?? 'No Data',
        subUnit: json["attributes"]["sub_unit"] ?? 'No Data',
        dateOfJoining: json["attributes"]["date_of_joining"] ?? 'No Data',
        location: json["attributes"]["location"] ?? 'No Data',
        bloodGroup: json["attributes"]["blood_group"] ?? 'No Data',
        avater: json["attributes"]["avater"] ?? 'No Data',
        active: json["attributes"]["active"] == 1 ? true : false,
        allotedLeaveDetail: json["attributes"]["alloted_leaves"] == null
            ? null
            : AllotedLeaveDetail.fromJson(json["attributes"]["alloted_leaves"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "employee_id": employeeId,
        "contact_number": contactNumber == 'No Data' ? null : contactNumber,
        "email": email == 'No Data' ? null : email,
        "designation": designation == 'No Data' ? null : designation,
        "grade": grade == 'No Data' ? null : grade,
        "division": division == 'No Data' ? null : division,
        "department": department == 'No Data' ? null : department,
        "unit": unit == 'No Data' ? null : unit,
        "sub_unit": subUnit == 'No Data' ? null : subUnit,
        "date_of_joining": dateOfJoining == 'No Data' ? null : dateOfJoining,
        "location": location == 'No Data' ? null : location,
        "blood_group": bloodGroup == 'No Data' ? null : bloodGroup,
        "avater": avater == 'No Data' ? null : avater,
        "active": active ? 1 : 0,
        "alloted_leaves": allotedLeaveDetail == null
            ? allotedLeaveDetail
            : allotedLeaveDetail!.toJson(),
      };

  String getJoiningDate() {
    return dateOfJoining;
  }
}
