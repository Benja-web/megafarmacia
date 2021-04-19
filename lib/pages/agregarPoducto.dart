import 'package:flutter/material.dart';
import 'package:megafarmacia/pages/plantilaPage.dart';
import 'package:megafarmacia/utils/constantes.dart';

class AgregarProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlantillaPage(
      titulo: 'Agregar producto',
      backgroundMenu: backgroundMenu,
      backgroundAppbar: backgroundAppbar,
      backgroundContent: backgroundContent,
      fontSize: fontSize,
      textTitlecolor: textTitlecolor,
      childMovil: Container(),
      actions: [],
    );
  }
}
