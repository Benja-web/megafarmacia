import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:megafarmacia/models/relacioncuentauserModel.dart';
import 'package:megafarmacia/models/usuarioModel.dart';
import 'package:megafarmacia/preferencias_usuario/preferencias.dart';
import 'package:megafarmacia/utils/constantes.dart';

class NewUserService with ChangeNotifier {
  final _prefs = new PreferenciasUsuario();

  Future<Map<String, dynamic>> newUser(
      {String correo, String password, String nombre, String telefono}) async {
    final authData = {
      'email': '$correo@megafarmacia.com',
      'password': password,
      'telefono': telefono,
      'nombre': nombre,
      'returnSecureToken': true,
    };

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseToken');

    final resp = await http.post(url, body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      _prefs.uid = decodedResp['localId'];

      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<bool> crearUsuario(Usuario usuario) async {
    final url = Uri.parse('$urlDataBase/usuarios.json?auth=${_prefs.token}');
    final resp = await http.post(url, body: usuarioToJson(usuario));
    final decodedData = json.decode(resp.body);
    _prefs.doc = decodedData['name'];
    return true;
  }

  Future<bool> crearRelacioncuentausrio(RelacionUser relacionUser) async {
    final url = Uri.parse(
        '$urlDataBase/usuariorrelacioncuenta.json?auth=${_prefs.token}');
    final resp = await http.post(url, body: relacionUserToJson(relacionUser));
    final decodedData = json.decode(resp.body);
    _prefs.reldoc = decodedData['name'];
    return true;
  }

  Future<dynamic> readProducto() async {
    final url = Uri.parse('$urlDataBase/usuarios.json?auth=${_prefs.token}');
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<Usuario> productos = [];
    if (decodedData == null) return [];
    decodedData.forEach((id, prod) {
      final prodTemp = Usuario.fromJson(prod);
      prodTemp.uid = id;
      productos.add(prodTemp);
    });
    Map user = {"user": productos};

    return user;
  }
}
