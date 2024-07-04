// To parse this JSON data, do
//
//     final topicsModel = topicsModelFromJson(jsonString);

import 'dart:convert';

TopicsModel topicsModelFromJson(String str) =>
    TopicsModel.fromJson(json.decode(str));

String topicsModelToJson(TopicsModel data) => json.encode(data.toJson());

class TopicsModel {
  final List<Datum>? data;

  TopicsModel({
    this.data,
  });

  factory TopicsModel.fromJson(Map<String, dynamic> json) => TopicsModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? name;
  final String? description;

  Datum({
    this.id,
    this.name,
    this.description,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
