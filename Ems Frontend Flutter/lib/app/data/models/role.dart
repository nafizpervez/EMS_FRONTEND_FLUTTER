import 'dart:convert';

import 'package:get/get.dart';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());

class Role {
  Role({
    required this.id,
    required this.department,
    required this.role,
    required this.designation,
  });

  final int id;
  final String department;
  final String role;
  final String designation;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: int.parse(json["id"]),
        department:
            GetUtils.capitalize(json["attributes"]["department"]).toString(),
        role: GetUtils.capitalize(json["attributes"]["role"]).toString(),
        designation:
            GetUtils.capitalize(json["attributes"]["designation"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "designation": designation,
        "department": department,
      };
}
