// To parse this JSON data, do
//
//     final notices = noticesFromJson(jsonString);

import 'dart:convert';

List<Notices> noticesFromJson(String str) => List<Notices>.from(json.decode(str).map((x) => Notices.fromJson(x)));

String noticesToJson(List<Notices> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notices {

  int? id;
  String? titulo;
  String? cuerpo;
  List<Notices> toList = [];

  Notices({
    this.id,
    this.titulo,
    this.cuerpo,
  });



  factory Notices.fromJson(Map<String, dynamic> json) => Notices(
    id: json["id"],
    titulo: json["titulo"],
    cuerpo: json["cuerpo"],
  );

 Notices.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Notices notices = Notices.fromJson(item);
      toList.add(notices);
    });
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "cuerpo": cuerpo,
  };
}
