import 'dart:convert';

import 'user_summary.dart';

CalendarEvent calendarEventFromJson(String str) =>
    CalendarEvent.fromJson(json.decode(str));

String calendarEventToJson(CalendarEvent data) => json.encode(data.toJson());

class CalendarEvent {
  CalendarEvent({
    required this.id,
    required this.type,
    required this.createdBy,
    required this.createdFor,
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    required this.dayLongEvent,
    required this.eventType,
  });

  final String id;
  final String type;
  final UserSummary createdBy;
  final UserSummary createdFor;
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final bool dayLongEvent;
  final String eventType;

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => CalendarEvent(
        id: json["id"],
        type: json["type"],
        createdBy: UserSummary.fromJson(json["attributes"]["created_by"]),
        createdFor: UserSummary.fromJson(json["attributes"]["created_for"]),
        title: json["attributes"]["title"],
        description: json["attributes"]["description"],
        from: DateTime.parse(json["attributes"]["from"]),
        to: DateTime.parse(json["attributes"]["to"]),
        dayLongEvent: json["attributes"]["day_long_event"] == 0 ? false : true,
        eventType: json["attributes"]["event_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "created_by": createdBy,
        "created_for": createdFor,
        "title": title,
        "description": description,
        "from": from,
        "to": to,
        "day_long_event": dayLongEvent,
        "event_type": eventType,
      };
}
