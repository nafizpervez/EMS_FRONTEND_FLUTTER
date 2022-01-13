import 'dart:convert';

FunnelInfo funnelInfoFromJson(String str) =>
    FunnelInfo.fromJson(json.decode(str));

String funnelInfoToJson(FunnelInfo data) => json.encode(data.toJson());

class FunnelInfo {
  FunnelInfo({
    required this.id,
    required this.projectName,
    required this.valueOfTheProject,
  });

  final String id;
  final String projectName;
  final int valueOfTheProject;

  factory FunnelInfo.fromJson(Map<String, dynamic> json) => FunnelInfo(
        id: json["id"],
        projectName: json["project_name"],
        valueOfTheProject: json["value_of_the_project"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "project_name": projectName,
        "value_of_the_project": valueOfTheProject,
      };
}
