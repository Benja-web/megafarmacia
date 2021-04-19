import 'package:meta/meta.dart';
import 'package:megafarmacia/models/productoModel.dart';
import 'package:megafarmacia/models/usuarioModel.dart';

class Pedido {
  final Usuario usuario;

  List<Producto> productos;
  int cantProductos;

  double total;
  Pedido(
      {@required this.usuario,
      @required this.productos,
      @required this.total,
      @required this.cantProductos});
}
