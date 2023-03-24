// To parse this JSON data, do
//
//     final deparments = deparmentsFromJson(jsonString);

import 'dart:convert';

Deparments deparmentsFromJson(String str) => Deparments.fromJson(json.decode(str));

String deparmentsToJson(Deparments data) => json.encode(data.toJson());

class Deparments {
  Deparments({
    required this.id,
    required this.descripcion,
  });

  int id;
  String descripcion;

  factory Deparments.fromJson(Map<String, dynamic> json) => Deparments(
    id: json["Id"],
    descripcion: json["Descripcion"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Descripcion": descripcion,
  };
}
