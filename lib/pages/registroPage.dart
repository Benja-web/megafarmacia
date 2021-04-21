import 'package:flutter/material.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/preferencias_usuario/preferencias.dart';
import 'package:provider/provider.dart';
import 'package:megafarmacia/services/loginPasswordRegistroService.dart';
import 'package:megafarmacia/services/newUser.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _usuarioController = TextEditingController();
  final _usuarioPasswordController = TextEditingController();
  final _usuarioNombreController = TextEditingController();
  final _usuarioTelefonoController = TextEditingController();
  final _prefs = new PreferenciasUsuario();
  @override
  void dispose() {
    _usuarioController.dispose();
    _usuarioPasswordController.dispose();
    _usuarioNombreController.dispose();
    _usuarioTelefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final comprobar = Provider.of<CamposRegistroService>(context);
    final newUser = Provider.of<NewUserService>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: MediaQuery.of(context).size.width > 700
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.25)
              : null,
          width: MediaQuery.of(context).size.width > 700
              ? MediaQuery.of(context).size.width * 0.50
              : double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    padding: EdgeInsets.only(top: 30),
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/imagenes/farmacia.jpg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Crear cuenta',
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width > 700 ? 30 : 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.05),
                                    offset: Offset(0, 5),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: TextField(
                              controller: _usuarioController,
                              maxLines: 1,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: 'Usuario',
                                  errorText: comprobar.registouser
                                      ? 'El nombre del usuario debe ser mayor a 6 caracteres'
                                      : null),
                              onChanged: (value) => comprobar.user = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.05),
                                    offset: Offset(0, 5),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: TextField(
                              controller: _usuarioPasswordController,
                              maxLines: 1,
                              obscureText: true,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Contraseña',
                                errorText: comprobar.registropassword
                                    ? 'La contraseña debe ser mayor a 6 caracteres'
                                    : null,
                              ),
                              onChanged: (value) => comprobar.password = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.05),
                                    offset: Offset(0, 5),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: TextField(
                              controller: _usuarioNombreController,
                              maxLines: 1,
                              obscureText: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Nombre',
                              ),
                              onChanged: (value) => comprobar.nombre = value,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.only(
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.05),
                                    offset: Offset(0, 5),
                                    blurRadius: 5,
                                  )
                                ]),
                            child: TextField(
                              controller: _usuarioTelefonoController,
                              maxLines: 1,
                              obscureText: false,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Telefono',
                              ),
                              onChanged: (value) => comprobar.telefono = value,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: comprobar.btn
                                  ? () async {
                                      Map result = await newUser.newUser(
                                          correo:
                                              _usuarioController.text.trim(),
                                          password: _usuarioPasswordController
                                              .text
                                              .trim(),
                                          nombre: _usuarioNombreController.text,
                                          telefono:
                                              _usuarioTelefonoController.text);
                                      if (result['ok']) {
                                        Usuario usuario = new Usuario(
                                          uid: _prefs.uid,
                                          nombre: _usuarioNombreController.text,
                                          email:
                                              '${_usuarioController.text}@megafarmacia.com',
                                          telefono:
                                              _usuarioTelefonoController.text,
                                          rol: 'ADMIN_ROLE',
                                        );

                                        final result2 =
                                            await newUser.crearUsuario(usuario);
                                        Navigator.pushReplacementNamed(
                                            context, 'principal');
                                      } else {}
                                    }
                                  : null,
                              child: Text('Crear cuenta'),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: TextButton(
                                child:
                                    Text('¿Tiene cuenta? ¡Ingrese con ella!'),
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, 'login'),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
