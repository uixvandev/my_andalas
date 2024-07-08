// To parse this JSON data, do
//
//     final seminarModel = seminarModelFromJson(jsonString);

import 'dart:convert';

SeminarModel seminarModelFromJson(String str) => SeminarModel.fromJson(json.decode(str));

String seminarModelToJson(SeminarModel data) => json.encode(data.toJson());

class SeminarModel {
    final List<seminarData> data;

    SeminarModel({
        required this.data,
    });

    factory SeminarModel.fromJson(Map<String, dynamic> json) => SeminarModel(
        data: List<seminarData>.from(json["data"].map((x) => seminarData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class seminarData {
    final String id;
    final String thesisId;
    final DateTime registeredAt;
    final int method;
    final DateTime seminarAt;
    final String roomId;
    final String onlineUrl;
    final String fileReport;
    final String fileSlide;
    final String fileJournal;
    final String fileAttendance;
    final int recommendation;
    final int status;
    final String description;

    seminarData({
        required this.id,
        required this.thesisId,
        required this.registeredAt,
        required this.method,
        required this.seminarAt,
        required this.roomId,
        required this.onlineUrl,
        required this.fileReport,
        required this.fileSlide,
        required this.fileJournal,
        required this.fileAttendance,
        required this.recommendation,
        required this.status,
        required this.description,
    });

    factory seminarData.fromJson(Map<String, dynamic> json) => seminarData(
        id: json["id"],
        thesisId: json["thesis_id"],
        registeredAt: DateTime.parse(json["registered_at"]),
        method: json["method"],
        seminarAt: DateTime.parse(json["seminar_at"]),
        roomId: json["room_id"],
        onlineUrl: json["online_url"],
        fileReport: json["file_report"],
        fileSlide: json["file_slide"],
        fileJournal: json["file_journal"],
        fileAttendance: json["file_attendance"],
        recommendation: json["recommendation"],
        status: json["status"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "thesis_id": thesisId,
        "registered_at": registeredAt.toIso8601String(),
        "method": method,
        "seminar_at": seminarAt.toIso8601String(),
        "room_id": roomId,
        "online_url": onlineUrl,
        "file_report": fileReport,
        "file_slide": fileSlide,
        "file_journal": fileJournal,
        "file_attendance": fileAttendance,
        "recommendation": recommendation,
        "status": status,
        "description": description,
    };
}
