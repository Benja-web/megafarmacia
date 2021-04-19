import 'package:flutter/material.dart';
import 'package:megafarmacia/utils/constantes.dart';
import 'package:megafarmacia/widgets/drawerWidget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MovilPagePlantilla extends StatelessWidget {
  final String titulo;
  final Color textTitlecolor;
  final List<Widget> actions;

  final Widget content;
  const MovilPagePlantilla(
      {Key key,
      @required this.titulo,
      @required this.textTitlecolor,
      @required this.content,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundContent,
      appBar: AppBar(
        backgroundColor: backgroundAppbar,
        title: Text(
          titulo,
          style: TextStyle(color: textTitlecolor),
        ),
        centerTitle: true,
        actions: actions,
      ),
      drawer: Container(
        width: kIsWeb
            ? MediaQuery.of(context).size.width * 0.15
            : MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: Container(
            color: backgroundMenu,
            child: DrawerPersonalizado(),
          ),
        ),
      ),
      body: content,
    );
  }
}
