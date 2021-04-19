import 'package:flutter/material.dart';
import 'package:megafarmacia/pages/agregarPoducto.dart';
import 'package:megafarmacia/pages/pedido.dart';
import 'package:megafarmacia/pages/productosPages.dart';

Map<String, WidgetBuilder> get routes => {
      'addproducto': (_) => AgregarProductoPage(),
      'productos': (_) => ProductosPage(),
      'pedido': (_) => PedidoPage(),
    };
