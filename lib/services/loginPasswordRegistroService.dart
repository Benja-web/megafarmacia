import 'package:flutter/material.dart';

class CamposRegistroService with ChangeNotifier {
  bool _btn = false;
  bool _registrouser = false;
  bool _registronombre = false;
  bool _registropassword = false;
  bool _registrotelefono = false;
  String _user = '';
  String _password = '';
  String _nombre = '';
  String _telefono = '';
  bool get btn => this._btn;
  bool get registouser => this._registrouser;
  bool get registonombre => this._registronombre;
  bool get registropassword => this._registropassword;
  bool get registrotelefono => this._registrotelefono;

  set btn(bool value) {
    this._btn = value;
    notifyListeners();
  }

  set user(String user) {
    this._user = user;
    if (user.length < 6) {
      this._registrouser = true;
    } else {
      this._registrouser = false;
    }
    this.comprobarCampos();
    notifyListeners();
  }

  set password(String password) {
    this._password = password;
    if (password.length < 6) {
      this._registropassword = true;
    } else {
      this._registropassword = false;
    }
    this.comprobarCampos();
    notifyListeners();
  }

  set nombre(String nombre) {
    this._nombre = nombre;
    if (nombre.length < 6) {
      this._registronombre = true;
    } else {
      this._registronombre = false;
    }
    this.comprobarCampos();
    notifyListeners();
  }

  set telefono(String telefono) {
    this._telefono = telefono;
    if (telefono.length < 6) {
      this._registrotelefono = true;
    } else {
      this._registrotelefono = false;
    }
    this.comprobarCampos();
    notifyListeners();
  }

  set registropassword(bool value) {
    this._registropassword = value;
    notifyListeners();
  }

  set registrouser(bool value) {
    this._registrouser = value;
    notifyListeners();
  }

  void comprobarCampos() {
    if (this._nombre.length > 6 &&
        this._user.length > 6 &&
        this._nombre.length > 6 &&
        this._telefono.length > 6) {
      this._btn = true;
      notifyListeners();
    } else {
      this._btn = false;
      notifyListeners();
    }
  }
}
