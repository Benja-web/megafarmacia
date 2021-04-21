import 'package:flutter/material.dart';
import 'package:megafarmacia/pages/agregarPoducto.dart';
import 'package:megafarmacia/pages/loginPage.dart';
import 'package:megafarmacia/pages/menuPage.dart';
import 'package:megafarmacia/pages/pedido.dart';
import 'package:megafarmacia/pages/productosPages.dart';
import 'package:megafarmacia/pages/registroPage.dart';

Map<String, WidgetBuilder> get routes => {
      'addproducto': (_) => AgregarProductoPage(),
      'productos': (_) => ProductosPage(),
      'pedido': (_) => PedidoPage(),
      'login': (_) => LoginPage(),
      'registrousuario': (_) => RegistroPage(),
      'principal': (_) => MenuPage(),
    };
