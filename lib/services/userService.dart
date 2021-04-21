import 'package:flutter/cupertino.dart';
import 'package:megafarmacia/models/usuarioModel.dart';

class UserService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario usuario) {
    this._usuario = usuario;
    notifyListeners();
  }
}
