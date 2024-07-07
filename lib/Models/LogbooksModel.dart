// To parse this JSON data, do
//
//     final logbooksModel = logbooksModelFromJson(jsonString);

import 'dart:convert';

LogbooksModel logbooksModelFromJson(String str) => LogbooksModel.fromJson(json.decode(str));

String logbooksModelToJson(LogbooksModel data) => json.encode(data.toJson());

class LogbooksModel {
    final String? status;
    final String? message;
    final int? count;
    final List<Log>? logs;

    LogbooksModel({
        this.status,
        this.message,
        this.count,
        this.logs,
    });

    factory LogbooksModel.fromJson(Map<String, dynamic> json) => LogbooksModel(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        logs: json["logs"] == null ? [] : List<Log>.from(json["logs"]!.map((x) => Log.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x.toJson())),
    };
}

class Log {
    final String? id;
    final String? thesisId;
    final String? supervisorId;
    final DateTime? date;
    final String? progress;
    final String? problem;
    final String? fileProgress;
    final String? supervisedBy;
    final DateTime? supervisedAt;
    final String? notes;
    final String? fileNotes;
    final int? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Log({
        this.id,
        this.thesisId,
        this.supervisorId,
        this.date,
        this.progress,
        this.problem,
        this.fileProgress,
        this.supervisedBy,
        this.supervisedAt,
        this.notes,
        this.fileNotes,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Log.fromJson(Map<String, dynamic> json) => Log(
        id: json["id"],
        thesisId: json["thesis_id"],
        supervisorId: json["supervisor_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        progress: json["progress"],
        problem: json["problem"],
        fileProgress: json["file_progress"],
        supervisedBy: json["supervised_by"],
        supervisedAt: json["supervised_at"] == null ? null : DateTime.parse(json["supervised_at"]),
        notes: json["notes"],
        fileNotes: json["file_notes"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "thesis_id": thesisId,
        "supervisor_id": supervisorId,
        "date": date?.toIso8601String(),
        "progress": progress,
        "problem": problem,
        "file_progress": fileProgress,
        "supervised_by": supervisedBy,
        "supervised_at": supervisedAt?.toIso8601String(),
        "notes": notes,
        "file_notes": fileNotes,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
