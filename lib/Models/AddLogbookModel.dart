// To parse this JSON data, do
//
//     final addLogbookModel = addLogbookModelFromJson(jsonString);

import 'dart:convert';

AddLogbookModel addLogbookModelFromJson(String str) => AddLogbookModel.fromJson(json.decode(str));

String addLogbookModelToJson(AddLogbookModel data) => json.encode(data.toJson());

class AddLogbookModel {
    final String? thesisId;
    final String? supervisorId;
    final DateTime? date;
    final String? progress;
    final String? problem;
    final int? status;
    final String? id;
    final DateTime? updatedAt;
    final DateTime? createdAt;

    AddLogbookModel({
        this.thesisId,
        this.supervisorId,
        this.date,
        this.progress,
        this.problem,
        this.status,
        this.id,
        this.updatedAt,
        this.createdAt,
    });

    factory AddLogbookModel.fromJson(Map<String, dynamic> json) => AddLogbookModel(
        thesisId: json["thesis_id"],
        supervisorId: json["supervisor_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        progress: json["progress"],
        problem: json["problem"],
        status: json["status"],
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "thesis_id": thesisId,
        "supervisor_id": supervisorId,
        "date": date?.toIso8601String(),
        "progress": progress,
        "problem": problem,
        "status": status,
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
    };
}
