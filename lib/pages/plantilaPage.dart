import 'package:flutter/material.dart';

import 'package:megafarmacia/plantillas/movilPagePlantilla.dart';

class PlantillaPage extends StatelessWidget {
  final String titulo;
  final Color backgroundMenu;
  final Color backgroundAppbar;
  final Color backgroundContent;
  final double fontSize;
  final Color textTitlecolor;

  final Widget childMovil;
  final List<Widget> actions;
  const PlantillaPage(
      {Key key,
      @required this.titulo,
      @required this.backgroundMenu,
      @required this.backgroundAppbar,
      @required this.backgroundContent,
      @required this.fontSize,
      @required this.textTitlecolor,
      @required this.childMovil,
      @required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MovilPagePlantilla(
        titulo: titulo,
        textTitlecolor: textTitlecolor,
        content: childMovil,
        actions: actions,
      ),
    );
  }
}
