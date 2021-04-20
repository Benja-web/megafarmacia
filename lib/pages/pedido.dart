import 'package:flutter/material.dart';
import 'package:megafarmacia/models/productoModel.dart';
import 'package:provider/provider.dart';
import 'package:megafarmacia/pages/PlantilaPage.dart';
import 'package:megafarmacia/services.dart/pedidoService.dart';
import 'package:megafarmacia/utils/constantes.dart';

class PedidoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<PedidoService>(context);
    return PlantillaPage(
        titulo: 'Pedido',
        backgroundMenu: backgroundMenu,
        backgroundAppbar: backgroundAppbar,
        backgroundContent: backgroundContent,
        fontSize: fontSize,
        textTitlecolor: textTitlecolor,
        actions: [
          Center(child: Text('\$ ${carrito.pedido.total.toString()}')),
        ],
        childMovil: Scaffold(
          body: _productos(context),
          floatingActionButton: FloatingActionButton(
            backgroundColor: backgroundAppbar,
            onPressed: () {},
            child: Icon(
              Icons.money,
              color: textTitlecolor,
            ),
          ),
        ));
  }

  Widget _productos(BuildContext context) {
    final carrito = Provider.of<PedidoService>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          itemCount: carrito.pedido.productos.length,
          itemBuilder: (context, index) {
            Producto producto = carrito.pedido.productos[index];

            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(producto.nombre),
                  Text(producto.precio.toString()),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.red,
                            ),
                            onPressed: () => carrito.agregarProducto(producto)),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => carrito.deleteProducto(producto)),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
