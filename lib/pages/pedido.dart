import 'package:flutter/material.dart';
import 'package:megafarmacia/models/productoModel.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:provider/provider.dart';
import 'package:megafarmacia/pages/PlantilaPage.dart';
import 'package:megafarmacia/services.dart/pedidoService.dart';
import 'package:megafarmacia/utils/constantes.dart';

class PedidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<PedidoService>(context);
    Usuario usuario = carrito.usuario;
    return PlantillaPage(
      titulo: 'Pedido',
      backgroundMenu: backgroundMenu,
      backgroundAppbar: backgroundAppbar,
      backgroundContent: backgroundContent,
      fontSize: fontSize,
      textTitlecolor: textTitlecolor,
      actions: [],
      childMovil: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'DATOS DEL PEDIDO',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Divider(),
              Text('Pedido a nombre de : ${usuario.nombre}'),
              Divider(),
              _productos(carrito.pedido.productos, carrito.total),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productos(List<Producto> productos, double total) {
    final p = <Widget>[];
    p.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Cantidad'),
        Text('Nombre'),
        Text('Precio unitario'),
        Text('Total')
      ],
    ));
    int n = 0;
    List<Producto> x = [];
    productos.forEach((element) {
      var temp = productos.where((e) => e == element);

      print(p.contains(element));
      if (!x.contains(element)) {
        p.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(temp.length.toString()),
            Text(element.nombre),
            Text('\$${element.precio.toString()}'),
            Text('\$${(temp.length * element.precio).toString()}'),
          ],
        ));
      }
      x.add(element);
    });
    p.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(),
        Container(),
        Container(),
        Text('\$ ${total.toString()}')
      ],
    ));
    return Column(
      children: p,
    );
  }
}
