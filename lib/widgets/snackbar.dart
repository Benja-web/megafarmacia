import 'package:flutter/material.dart';

void mostrarSnackbar(BuildContext context, String mensaje) {
  final snackBar = SnackBar(
    content: Text(mensaje),
    duration: Duration(milliseconds: 1500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
