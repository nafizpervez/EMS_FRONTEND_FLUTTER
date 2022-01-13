import 'dart:convert';

Announcement announcementFromJson(String str) =>
    Announcement.fromJson(json.decode(str));

String announcementToJson(Announcement data) => json.encode(data.toJson());

class Announcement {
  Announcement({
    required this.announcement,
  });

  final String announcement;

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        announcement: json["announcement"],
      );

  Map<String, dynamic> toJson() => {
        "announcement": announcement,
      };
}
