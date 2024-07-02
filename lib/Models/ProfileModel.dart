// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  final String? status;
  final String? message;
  final Data? data;

  Profile({
    this.status,
    this.message,
    this.data,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? id;
  final dynamic nik;
  final String? nim;
  final String? name;
  final int? year;
  final dynamic gender;
  final dynamic birthday;
  final dynamic birthplace;
  final dynamic phone;
  final dynamic address;
  final String? departmentId;
  final dynamic photo;
  final dynamic maritalStatus;
  final int? religion;
  final int? status;
  final String? counselorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? departmentName;
  final String? username;
  final String? email;

  Data({
    this.id,
    this.nik,
    this.nim,
    this.name,
    this.year,
    this.gender,
    this.birthday,
    this.birthplace,
    this.phone,
    this.address,
    this.departmentId,
    this.photo,
    this.maritalStatus,
    this.religion,
    this.status,
    this.counselorId,
    this.createdAt,
    this.updatedAt,
    this.departmentName,
    this.username,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nik: json["nik"],
        nim: json["nim"],
        name: json["name"],
        year: json["year"],
        gender: json["gender"],
        birthday: json["birthday"],
        birthplace: json["birthplace"],
        phone: json["phone"],
        address: json["address"],
        departmentId: json["department_id"],
        photo: json["photo"],
        maritalStatus: json["marital_status"],
        religion: json["religion"],
        status: json["status"],
        counselorId: json["counselor_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        departmentName: json["department_name"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nim": nim,
        "name": name,
        "year": year,
        "gender": gender,
        "birthday": birthday,
        "birthplace": birthplace,
        "phone": phone,
        "address": address,
        "department_id": departmentId,
        "photo": photo,
        "marital_status": maritalStatus,
        "religion": religion,
        "status": status,
        "counselor_id": counselorId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "department_name": departmentName,
        "username": username,
        "email": email,
      };
}
