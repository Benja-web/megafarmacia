import 'package:meta/meta.dart';

class Producto {
  String nombre;
  String presentacion;
  String categoria;
  String composicion;
  double costo;
  String fotoproducto;
  String provedor;
  String laboratorio;
  String marca;
  double precio;
  int cantidad;
  Producto({
    @required this.nombre,
    @required this.presentacion,
    @required this.categoria,
    @required this.composicion,
    @required this.costo,
    @required this.fotoproducto,
    @required this.provedor,
    @required this.laboratorio,
    @required this.marca,
    @required this.precio,
    @required this.cantidad,
  });
}
