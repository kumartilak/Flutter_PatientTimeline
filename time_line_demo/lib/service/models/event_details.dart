// To parse this JSON data, do
//
//     final eventDetails = eventDetailsFromJson(jsonString);

import 'dart:convert';

EventDetails eventDetailsFromJson(String str) =>
    EventDetails.fromJson(json.decode(str));

String eventDetailsToJson(EventDetails data) => json.encode(data.toJson());

class EventDetails {
  EventDetails({
    this.data,
    this.code,
    this.message,
    this.timestamp,
  });

  List<Event> data;
  int code;
  String message;
  DateTime timestamp;

  factory EventDetails.fromJson(Map<String, dynamic> json) => EventDetails(
        data: List<Event>.from(json["data"].map((x) => Event.fromJson(x))),
        code: json["code"],
        message: json["message"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
        "timestamp": timestamp.toIso8601String(),
      };
}

class Event {
  Event({
    this.id,
    this.eventname,
    this.dateTime,
    this.photo,
    this.type,
    this.result,
    this.status,
    this.assigned,
    this.patientId,
  });

  String id;
  String eventname;
  DateTime dateTime;
  String photo;
  String type;
  String result;
  String status;
  String assigned;
  String patientId;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        eventname: json["eventname"],
        dateTime: DateTime.parse(json["date_time"]),
        photo: json["photo"],
        type: json["type"],
        result: json["result"],
        status: json["status"],
        assigned: json["assigned"],
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "eventname": eventname,
        "date_time": dateTime.toIso8601String(),
        "photo": photo,
        "type": type,
        "result": result,
        "status": status,
        "assigned": assigned,
        "patientId": patientId,
      };
}
