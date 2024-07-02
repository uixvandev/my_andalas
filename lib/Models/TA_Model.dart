// To parse this JSON data, do
//
//     final responseTheses = responseThesesFromJson(jsonString);

import 'dart:convert';

ResponseTheses responseThesesFromJson(String str) => ResponseTheses.fromJson(json.decode(str));

String responseThesesToJson(ResponseTheses data) => json.encode(data.toJson());

class ResponseTheses {
    final String status;
    final String message;
    final int count;
    final List<Thesis> theses;

    ResponseTheses({
        required this.status,
        required this.message,
        required this.count,
        required this.theses,
    });

    factory ResponseTheses.fromJson(Map<String, dynamic> json) => ResponseTheses(
        status: json["status"],
        message: json["message"],
        count: json["count"],
        theses: List<Thesis>.from(json["theses"].map((x) => Thesis.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "count": count,
        "theses": List<dynamic>.from(theses.map((x) => x.toJson())),
    };
}

class Thesis {
    final String id;
    final String topicId;
    final String studentId;
    final String title;
    final String thesisAbstract;
    final dynamic startAt;
    final int status;
    final dynamic grade;
    final dynamic gradeBy;
    final String createdBy;
    final DateTime createdAt;
    final DateTime updatedAt;

    Thesis({
        required this.id,
        required this.topicId,
        required this.studentId,
        required this.title,
        required this.thesisAbstract,
        required this.startAt,
        required this.status,
        required this.grade,
        required this.gradeBy,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Thesis.fromJson(Map<String, dynamic> json) => Thesis(
        id: json["id"],
        topicId: json["topic_id"],
        studentId: json["student_id"],
        title: json["title"],
        thesisAbstract: json["abstract"],
        startAt: json["start_at"],
        status: json["status"],
        grade: json["grade"],
        gradeBy: json["grade_by"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topic_id": topicId,
        "student_id": studentId,
        "title": title,
        "abstract": thesisAbstract,
        "start_at": startAt,
        "status": status,
        "grade": grade,
        "grade_by": gradeBy,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
