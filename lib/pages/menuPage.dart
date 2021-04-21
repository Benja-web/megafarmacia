import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/pages/plantilaPage.dart';
import 'package:megafarmacia/preferencias_usuario/preferencias.dart';
import 'package:megafarmacia/services/newUser.dart';
import 'package:megafarmacia/utils/constantes.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final newUser = Provider.of<NewUserService>(context);
    return PlantillaPage(
      titulo: 'MegaFarmacia',
      backgroundMenu: backgroundMenu,
      backgroundAppbar: backgroundAppbar,
      backgroundContent: backgroundContent,
      fontSize: fontSize,
      textTitlecolor: textTitlecolor,
      childMovil: FutureBuilder(
        future: newUser.readProducto(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            print(snapshot.data);
            return _ListaUsuarios(snapshot.data['user']);
          }

          // print(snapshot.data);
          // return Container();
        },
      ),
      actions: [],
    );
  }

  /* _usuarios(BuildContext context, List<Usuario> _usuarios) {
    return ListView.builder(
        itemCount: _usuarios.length,
        itemBuilder: (context, index) {
          Usuario usuario = _usuarios[index];
          if (usuario.uid != _prefs.uid) {
            return ListTile(
              title: Text(usuario.nombre),
            );
          } else {
            return Container();
          }
        });
  } */
}

class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;
  _ListaUsuarios(this.usuarios);
  @override
  Widget build(BuildContext context) {
    final _prefs = new PreferenciasUsuario();
    print(usuarios.length);
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          Usuario usuario = usuarios[index];
          if (usuario.uid != _prefs.uid) {
            return ListTile(
              title: Text(usuario.nombre),
            );
          } else {
            return Container();
          }
        });
  }
}
