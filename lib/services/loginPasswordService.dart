import 'package:flutter/material.dart';

class LoginPasswordService with ChangeNotifier {
  bool _habilitarBtn = false;
  bool _errorusuario = false;
  bool _errorpassword = false;

  bool get habilitarBtn => this._habilitarBtn;
  bool get errorUsuario => this._errorusuario;
  bool get errorpassword => this._errorpassword;

  set habilitarBtn(bool value) {
    this._habilitarBtn = value;
    notifyListeners();
  }

  set errorUsuario(bool value) {
    this._errorusuario = value;
    notifyListeners();
  }

  set errorpassword(bool value) {
    this._errorpassword = value;
    notifyListeners();
  }

  void comprobarUsuario(String value) {
    if (value.length > 6) {
      this.errorUsuario = false;
      this.changueEstadoBtn();
    } else {
      this.errorUsuario = true;
      this.changueEstadoBtn();
    }
  }

  void comprobarPassword(String value) {
    if (value.length > 6) {
      this.errorpassword = false;
      this.changueEstadoBtn();
    } else {
      this.errorpassword = true;
      this.changueEstadoBtn();
    }
  }

  void changueEstadoBtn() {
    if (this._errorusuario == false && this._errorpassword == false) {
      this._habilitarBtn = true;
    } else {
      this._habilitarBtn = false;
    }
    notifyListeners();
  }
}
