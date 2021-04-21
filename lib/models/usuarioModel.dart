// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.online,
    this.activo,
    this.estado,
    this.nombre,
    this.email,
    this.rol,
    this.uid,
    this.telefono,
  });

  bool online;
  bool activo;
  bool estado;
  String nombre;
  String email;
  String rol;
  String uid;
  String telefono;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        online: json["online"],
        activo: json["activo"],
        estado: json["estado"],
        nombre: json["nombre"],
        email: json["email"],
        rol: json["rol"],
        uid: json["uid"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "activo": activo,
        "estado": estado,
        "nombre": nombre,
        "email": email,
        "rol": rol,
        "uid": uid,
        "telefono": telefono,
      };
}
