// To parse this JSON data, do
//
//     final patientsData = patientsDataFromJson(jsonString);

import 'dart:convert';

PatientsData patientsDataFromJson(String str) =>
    PatientsData.fromJson(json.decode(str));

String patientsDataToJson(PatientsData data) => json.encode(data.toJson());

class PatientsData {
  PatientsData({
    this.data,
    this.code,
    this.message,
    this.timestamp,
  });

  List<Patient> data;
  int code;
  String message;
  DateTime timestamp;

  factory PatientsData.fromJson(Map<String, dynamic> json) => PatientsData(
        data: List<Patient>.from(json["data"].map((x) => Patient.fromJson(x))),
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

class Patient {
  Patient({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.bloodGroup,
    this.address,
    this.phoneNumber,
    this.photo,
  });

  String id;
  String name;
  int age;
  String gender;
  String bloodGroup;
  String address;
  String phoneNumber;
  String photo;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        bloodGroup: json["blood_group"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": gender,
        "blood_group": bloodGroup,
        "address": address,
        "phone_number": phoneNumber,
        "photo": photo,
      };
}
