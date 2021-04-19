import 'package:flutter/material.dart';
import 'package:megafarmacia/utils/constantes.dart';
import 'package:megafarmacia/widgets/drawerWidget.dart';

class PlantillaWeb extends StatelessWidget {
  final double porcentejePantalla;
  final double porcentejePantallaMenu;

  final double porcentejePantallaContent;

  final String titulo;
  final double fontSize;
  final Color textTitlecolor;
  final Widget content;
  const PlantillaWeb({
    Key key,
    @required this.porcentejePantalla,
    @required this.porcentejePantallaMenu,
    @required this.porcentejePantallaContent,
    @required this.titulo,
    @required this.fontSize,
    @required this.textTitlecolor,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * porcentejePantalla,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width:
                    MediaQuery.of(context).size.width * porcentejePantallaMenu,
                color: backgroundMenu,
                child: DrawerPersonalizado(),
              ),
              //Content
              Container(
                width: MediaQuery.of(context).size.width *
                    porcentejePantallaContent,
                color: backgroundContent,
                child: Column(
                  children: <Widget>[
                    //title
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      color: backgroundAppbar,
                      child: Center(
                        child: Text(
                          titulo,
                          style: TextStyle(
                              fontSize: fontSize, color: textTitlecolor),
                        ),
                      ),
                    ),
                    //content
                    Container(
                      child: content,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
