// To parse this JSON data, do
//
//     final detailTa = detailTaFromJson(jsonString);

import 'dart:convert';

DetailTa detailTaFromJson(String str) => DetailTa.fromJson(json.decode(str));

String detailTaToJson(DetailTa data) => json.encode(data.toJson());

class DetailTa {
  final String? id;
  final String? topicId;
  final String? studentId;
  final String? title;
  final String? detailTaAbstract;
  final dynamic startAt;
  final int? status;
  final dynamic grade;
  final dynamic gradeBy;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? logs;
  final List<dynamic>? supervisors;
  final List<dynamic>? seminars;
  final List<dynamic>? defenses;

  DetailTa({
    this.id,
    this.topicId,
    this.studentId,
    this.title,
    this.detailTaAbstract,
    this.startAt,
    this.status,
    this.grade,
    this.gradeBy,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.logs,
    this.supervisors,
    this.seminars,
    this.defenses,
  });

  factory DetailTa.fromJson(Map<String, dynamic> json) => DetailTa(
        id: json["id"],
        topicId: json["topic_id"],
        studentId: json["student_id"],
        title: json["title"],
        detailTaAbstract: json["abstract"],
        startAt: json["start_at"],
        status: json["status"],
        grade: json["grade"],
        gradeBy: json["grade_by"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        logs: json["logs"] == null
            ? []
            : List<dynamic>.from(json["logs"]!.map((x) => x)),
        supervisors: json["supervisors"] == null
            ? []
            : List<dynamic>.from(json["supervisors"]!.map((x) => x)),
        seminars: json["seminars"] == null
            ? []
            : List<dynamic>.from(json["seminars"]!.map((x) => x)),
        defenses: json["defenses"] == null
            ? []
            : List<dynamic>.from(json["defenses"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic_id": topicId,
        "student_id": studentId,
        "title": title,
        "abstract": detailTaAbstract,
        "start_at": startAt,
        "status": status,
        "grade": grade,
        "grade_by": gradeBy,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x)),
        "supervisors": supervisors == null
            ? []
            : List<dynamic>.from(supervisors!.map((x) => x)),
        "seminars":
            seminars == null ? [] : List<dynamic>.from(seminars!.map((x) => x)),
        "defenses":
            defenses == null ? [] : List<dynamic>.from(defenses!.map((x) => x)),
      };
}
