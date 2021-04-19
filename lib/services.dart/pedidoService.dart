import 'package:flutter/cupertino.dart';
import 'package:megafarmacia/models/pedidoModel.dart';
import 'package:megafarmacia/models/productoModel.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/pages/productosPages.dart';

class PedidoService with ChangeNotifier {
  Pedido _pedido;

  Pedido get pedido => this._pedido;
  bool get exitepedido => this._pedido != null ? true : false;
  get total => this._pedido.total;
  Usuario get usuario => this._pedido.usuario;
  int get cantidad => this._pedido.cantProductos;

  set pedido(Pedido pedido) {
    this._pedido = pedido;
    notifyListeners();
  }

  void deletepedido() {
    this._pedido = pedido;
    notifyListeners();
  }

  bool existeproducto(Producto producto) {
    if (this._pedido.productos.contains(producto)) {
      return true;
    } else {
      return false;
    }
  }

  void agregarProducto(Producto producto) {
    this._pedido.productos.add(producto);
    this._pedido.cantProductos += 1;
    this._pedido.total += producto.precio;
    notifyListeners();
  }

  void deleteProducto(Producto producto) {
    if (this._pedido.productos.contains(producto)) {
      this._pedido.productos.forEach((e) {
        if (e == producto) {
          Producto temp = e;
          temp.cantidad += -1;
          this._pedido.productos.remove(producto);
          if (temp.cantidad != 0) {
            this._pedido.productos.add(producto);
          }
        }
      });
    } else {
      this._pedido.productos.add(producto);
    }
    notifyListeners();
  }
}
