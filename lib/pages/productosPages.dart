import 'package:flutter/material.dart';
import 'package:megafarmacia/models/pedidoModel.dart';

import 'package:megafarmacia/models/productoModel.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/pages/plantilaPage.dart';
import 'package:megafarmacia/services/pedidoService.dart';
import 'package:megafarmacia/utils/constantes.dart';
import 'package:provider/provider.dart';

class ProductosPage extends StatefulWidget {
  @override
  _ProductosPageState createState() => _ProductosPageState();
}

class _ProductosPageState extends State<ProductosPage> {
  List<Producto> _productos = <Producto>[];

  @override
  void initState() {
    _productosBd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final carrito = Provider.of<PedidoService>(context);

    return PlantillaPage(
      titulo: 'Ver productos',
      backgroundMenu: backgroundMenu,
      backgroundAppbar: backgroundAppbar,
      backgroundContent: backgroundContent,
      fontSize: fontSize,
      textTitlecolor: textTitlecolor,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 20.0, top: 10),
          child: Row(
            children: <Widget>[
              Center(
                child: MaterialButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'pedido'),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: textBtnColor,
                      ),
                      carrito.exitepedido
                          ? Text(
                              '(${carrito.cantidad.toString()})',
                              style: TextStyle(color: textBtnColor),
                            )
                          : Text(
                              '(0)',
                              style: TextStyle(color: textBtnColor),
                            )
                    ],
                  ),
                ),
              ),
              carrito.exitepedido ? Text('\$ ${carrito.total}') : Text('\$0.0')
            ],
          ),
        )
      ],
      childMovil: Scaffold(
          body: _cuadroProductos(carrito),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Usuario user = new Usuario(
                  uid: '1',
                  nombre: 'Benjamin ',
                  email: 'test@test.com',
                  telefono: '4525269883');
              carrito.pedido = new Pedido(
                  usuario: user, productos: [], total: 0.0, cantProductos: 0);
            },
            child: Icon(Icons.add_shopping_cart),
          )),
    );
  }

  GridView _cuadroProductos(PedidoService carrito) {
    return GridView.builder(
        padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 150)),
        itemCount: _productos.length,
        itemBuilder: (context, index) {
          final String fotoproducto = _productos[index].fotoproducto;
          var item = _productos[index];

          return Card(
            elevation: 4.0,
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/imagenes/$fotoproducto',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      item.nombre,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            ' (${item.cantidad.toString()})',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          Text(
                            '\$ ${item.precio.toString()}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          carrito.exitepedido
                              ? IconButton(
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    color: carrito.existeproducto(item)
                                        ? Colors.green
                                        : Colors.blue,
                                  ),
                                  onPressed: () {
                                    item.cantidad = 1;
                                    carrito.agregarProducto(item);
                                  })
                              : Container(),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  void _productosBd() {
    var list = <Producto>[
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metformina.jpg',
          laboratorio: 'labmex',
          marca: 'Patito',
          nombre: 'Metformina 1',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Metformina 2',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 3',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 4',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 5',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 6',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 7',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 8',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 9',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 10',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 11',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 12',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 13',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 14',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 15',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 16',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 17',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
      Producto(
          cantidad: 45,
          categoria: 'Diabetes',
          composicion: '',
          costo: 30.80,
          fotoproducto: 'metforminalabchile.jpg',
          laboratorio: 'labchile',
          marca: 'Patito',
          nombre: 'Queteapina 18',
          precio: 40.0,
          presentacion: 'Caja con 30 tabletas de 850 mg',
          provedor: 'Seguro Social'),
    ];
    setState(() {
      _productos = list;
    });
  }
}
