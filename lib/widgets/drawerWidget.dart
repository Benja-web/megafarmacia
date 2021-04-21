import 'package:flutter/material.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/services/newUser.dart';

import 'package:megafarmacia/utils/constantes.dart';
import 'package:provider/provider.dart';

class DrawerPersonalizado extends StatelessWidget {
  const DrawerPersonalizado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(''),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/imagenes/farmacia.jpg'),
                    fit: BoxFit.fitWidth)),
          ),
          _btnIten('Principal', Icons.home,
              () => Navigator.pushReplacementNamed(context, 'principal')),
          Divider(),
          _btnIten('Agregar producto', Icons.add,
              () => Navigator.pushReplacementNamed(context, 'addproducto')),
          Divider(),
          _btnIten('Ver productos', Icons.store,
              () => Navigator.pushReplacementNamed(context, 'productos')),
        ],
      ),
    );
  }

  MaterialButton _btnIten(String title, IconData icons, Function function) {
    return MaterialButton(
        onPressed: function,
        color: btnColor,
        child: Row(
          children: <Widget>[
            Icon(
              icons,
              color: textBtnColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: textBtnColor,
              ),
            ),
          ],
        ));
  }
}
