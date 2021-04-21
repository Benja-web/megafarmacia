// To parse this JSON data, do
//
//     final relacionUser = relacionUserFromJson(jsonString);

import 'dart:convert';

RelacionUser relacionUserFromJson(String str) =>
    RelacionUser.fromJson(json.decode(str));

String relacionUserToJson(RelacionUser data) => json.encode(data.toJson());

class RelacionUser {
  RelacionUser({
    this.localId,
    this.documento,
  });

  String localId;
  String documento;

  factory RelacionUser.fromJson(Map<String, dynamic> json) => RelacionUser(
        localId: json["localId"],
        documento: json["documento"],
      );

  Map<String, dynamic> toJson() => {
        "localId": localId,
        "documento": documento,
      };
}
