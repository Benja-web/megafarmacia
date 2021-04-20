import 'package:flutter/material.dart';
import 'package:megafarmacia/services/loginPasswordService.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final comprobar = Provider.of<LoginPasswordService>(context);

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
                      'Login',
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
                              controller: _emailController,
                              maxLines: 1,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: 'Usuario',
                                  errorText: comprobar.errorUsuario
                                      ? 'El nombre del usuario debe ser mayor a 6 caracteres'
                                      : null),
                              onChanged: (value) =>
                                  comprobar.comprobarUsuario(value),
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
                              controller: _passwordController,
                              maxLines: 1,
                              obscureText: true,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Contraseña',
                                errorText: comprobar.errorpassword
                                    ? 'La contraseña debe ser mayor a 6 caracteres'
                                    : null,
                              ),
                              onChanged: (value) =>
                                  comprobar.comprobarPassword(value),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Colors.blue,
                              onPressed: comprobar.habilitarBtn ? () {} : null,
                              child: Text('Ingresar'),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: TextButton(
                                child: Text('¿No tiene cuenta? ¡Creala ahora!'),
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, 'registrousuario'),
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
