import 'package:meta/meta.dart';

class Usuario {
  final String uid;
  String nombre;
  String email;
  String telefono;
  Usuario({
    @required this.uid,
    @required this.nombre,
    @required this.email,
    @required this.telefono,
  });
}
