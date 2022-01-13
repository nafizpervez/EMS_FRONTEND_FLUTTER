import 'dart:convert';

Attachment attachmentsFromJson(String str) =>
    Attachment.fromJson(json.decode(str));

String attachmentsToJson(Attachment data) => json.encode(data.toJson());

class Attachment {
  Attachment({
    required this.id,
    required this.attachmentType,
    required this.attachmentUrl,
  });

  final String id;
  final String attachmentType;
  final String attachmentUrl;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        attachmentType: json["attributes"]["attachment_type"],
        attachmentUrl: json["attributes"]["attachment_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attachment_type": attachmentType,
        "attachment_url": attachmentUrl,
      };
}
